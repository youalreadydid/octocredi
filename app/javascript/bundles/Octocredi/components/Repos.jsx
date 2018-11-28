import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Router, Route } from "react-router-dom";
import createBrowserHistory from "history/createBrowserHistory";
import axios from 'axios';
import RepoList from './RepoList';
import Grid from '@material-ui/core/Grid';
import Paper from '@material-ui/core/Paper';
import AppBar from '@material-ui/core/AppBar';
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import Typography from '@material-ui/core/Typography';

export default class Repos extends Component {
  static propTypes = {
    languages: PropTypes.array.isRequired
  };

  constructor(props) {
    super(props);

    const history = createBrowserHistory();
    this.state = {
      repos: [],
      isLoading: true,
      language: this.getLanguage(history) || this.props.languages[0],
      history
    };
  }

  componentDidMount() {
    this.getRepos(this.state.language);
  }

  getLanguage = (history) => history.location.search.replace('?lang=', '');

  handleLanguage = (_e, index) => {
    const language = this.props.languages[index];
    let history = this.state.history;

    history.push(`/?lang=${language}`);
    this.setState({ history, language });
    this.getRepos(language);
  };

  getRepos = (language) => {
    this.setState({ isLoading: true });

    axios.get(`/repos?language=${language}`)
    .then(result => {
      let repos = this.state.repos;
      repos[language] = result.data.repos;
      this.setState({ repos, isLoading: false })
    })
    .catch(error => this.setState({ isLoading: false }));
  };

  render() {
    const languages = this.props.languages;
    const { language, repos, isLoading } = this.state;

    let languageIndex = languages.indexOf(language);
    if (languageIndex < 0) languageIndex = 0;

    return (
      <Router history={this.state.history}>
        <Grid container direction="row" justify="center" alignItems="center">
          <div style={{width: '100%'}}>
            <Typography align="center" variant="h6">
              OctoCredi
            </Typography>
            <Typography align="center" variant="subtitle1">
              Repositórios populares no GitHub
            </Typography>
            <br/>
            <Paper>
              <AppBar position="static">
                <Tabs centered value={languageIndex} onChange={this.handleLanguage}>
                  {languages.map((language) => <Tab key={language} label={language} />)}
                </Tabs>
              </AppBar>
              <Route
                path="/"
                render={props => <RepoList repos={repos[language] || []} isLoading={isLoading} />}
              />
            </Paper>
          </div>
        </Grid>
      </Router>
    );
  }
}
