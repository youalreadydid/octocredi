import React from 'react';
import PropTypes from 'prop-types';
import Typography from '@material-ui/core/Typography';

const repoContent = (repo) => {
  const content = []
  const has = {
    'has_projects': 'projetos',
    'has_downloads': 'downloads',
    'has_wiki': 'wiki',
    'has_pages': 'páginas'
  }

  Object.keys(has).forEach(key => {
    if (repo[key]) {
      let url = `${repo.html_url}/${key.replace('has_', '')}`;
      content.push([has[key], url]);
    }
  });

  return content;
};

const repoContentElements = (elements) => {
  const size = elements.length - 1;
  return elements.map((v, i) => (
    <span key={i}>
      <a href={v[1]} target="_blank">{v[0]}</a>
      {(i < size) && ", "}
    </span>
  ));
};

const RepoListContent = ({ repo }) => {
  const content = repoContent(repo);
  const elements = repoContentElements(content);

  return (
    <span>
      {repo.has_issues && <span>Existem <b>{repo.open_issues_count}</b> issues abertas<br/></span>}
      {(elements.length > 0) && <span><b>O repositório possui:</b> {elements}.<br/></span>}
    </span>
  );
};

RepoListContent.propTypes = {
  repo: PropTypes.object.isRequired,
}

export default RepoListContent;
