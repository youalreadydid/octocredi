import React from 'react';
import PropTypes from 'prop-types';
import Tooltip from '@material-ui/core/Tooltip';
import Icon from '@material-ui/core/Icon';

const RepoListIcon = ({ title, icon, value }) => (
  <Tooltip title={title} aria-label={title}>
    <span style={{width: '80px', textAlign: 'center'}}>
      <Icon>{icon}</Icon>
      <span>{value}</span>
    </span>
  </Tooltip>
);

RepoListIcon.propTypes = {
  title: PropTypes.string.isRequired,
  icon: PropTypes.string.isRequired,
  value: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number
  ])
}

export default RepoListIcon;
