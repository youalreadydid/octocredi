import React from 'react';
import PropTypes from 'prop-types';
import Typography from '@material-ui/core/Typography';
import Avatar from '@material-ui/core/Avatar';

const RepoListOwner = ({ owner }) => {
  return (
    <div>
      <Typography variant="h6">Mantido por:</Typography>
      <br/>
      <Typography variant="subtitle1">
        <a href={owner.html_url} target="_blank" style={{display: 'inline-flex', alignItems: 'center'}}>
          <Avatar alt={`${owner.login || owner.gravatar_id} avatar`} src={owner.avatar_url} />&nbsp;
          <span>{owner.login}</span>
        </a>
      </Typography>
      <Typography>
        <b>Tipo de usuário:</b> {owner.user_type}<br/>
        {owner.site_admin && <b>Administrador<br/></b>}
      </Typography>
    </div>
  );
};

RepoListOwner.propTypes = {
  owner: PropTypes.object.isRequired,
}

export default RepoListOwner;
