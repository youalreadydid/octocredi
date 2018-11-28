import React, { Component } from 'react';
import PropTypes from 'prop-types';
import RepoListIcon from './RepoListIcon';
import RepoListContent from './RepoListContent';
import RepoListOwner from './RepoListOwner';
import ExpansionPanel from '@material-ui/core/ExpansionPanel';
import ExpansionPanelSummary from '@material-ui/core/ExpansionPanelSummary';
import ExpansionPanelDetails from '@material-ui/core/ExpansionPanelDetails';
import Typography from '@material-ui/core/Typography';
import LinearProgress from '@material-ui/core/LinearProgress';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';
import Icon from '@material-ui/core/Icon';
import Tooltip from '@material-ui/core/Tooltip';
import Divider from '@material-ui/core/Divider';
import Emoji from 'react-emoji-render';

export default class RepoList extends Component {
  static propTypes = {
    repos: PropTypes.array,
    isLoading: PropTypes.bool.isRequired
  };

  formatDate = timestamp => {
    const date = new Date(timestamp);
    return date.toLocaleDateString('pt-BR');
  };

  render() {
    const { repos, isLoading } = this.props;

    if (repos.length < 1 && !isLoading) return <Typography>Nenhum repositório encontrado.</Typography>;

    return (
      <div>
        {isLoading && <LinearProgress color="secondary" />}
        {repos.map(repo => (
          <ExpansionPanel key={repo.id}>
            <ExpansionPanelSummary expandIcon={<ExpandMoreIcon />} style={{justifyContent: 'space-between'}}>
              <Typography style={{flexBasis: '50%', alignSelf: 'center'}}>
                {repo.name}
              </Typography>
              <Typography style={{flexBasis: '50%', display: 'flex', justifyContent: 'space-evenly'}}>
                <RepoListIcon title="Estrelas" icon="stars" value={repo.stargazers_count} />
                <RepoListIcon title="Forks" icon="merge_type" value={repo.forks_count} />
              </Typography>
            </ExpansionPanelSummary>
            <ExpansionPanelDetails>
              <div style={{display: 'flex', justifyContent: 'space-between', width: '100%'}}>
                <div style={{flexBasis: '70%'}}>
                  <Typography variant="h6">
                    <a href={repo.html_url} target="_blank">{repo.full_name}</a>
                    {repo.homepage && <span> | <a href={repo.homepage}><Icon>link</Icon> Homepage</a></span>}
                    {repo.archived && <span> | <Tooltip title="Arquivado" aria-label="Arquivado">
                      <Icon>archive</Icon>
                    </Tooltip></span>}
                    {repo.fork && <span> | <Tooltip title="Fork" aria-label="Fork">
                      <Icon>merge_type</Icon>
                    </Tooltip></span>}
                    {(typeof repo.license === 'object') && <span> | Licença: <a href={repo.license.url} target="_blank">{repo.license.name}</a></span>}
                  </Typography>
                  <Typography variant="subtitle1">
                    <Emoji text={repo.description} />
                  </Typography>
                  <br/>
                  <Typography>
                    <b>Criado em:</b> {this.formatDate(repo.repo_created_at)} | <b>Atualizado em:</b> {this.formatDate(repo.repo_updated_at)}
                    <br/>
                    <b>Último push:</b> {this.formatDate(repo.repo_pushed_at)}
                    <br/>
                    <RepoListContent repo={repo} />
                    <br/>
                    <b>Branch padrão:</b> {repo.default_branch} | <b>Tamanho:</b> {repo.size.toLocaleString('pt-BR')}KB
                  </Typography>
                </div>
                <div style={{flexBasis: '29%'}}>
                  <RepoListOwner owner={repo.owner} />
                </div>
              </div>
            </ExpansionPanelDetails>
          </ExpansionPanel>
        ))}
      </div>
    );
  }
}
