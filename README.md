# OctoCredi

OctoCredi is an example application that shows Top 5 repositories (and their public data) from GitHub by programming language. Available for Ruby, Elixir, Javascript, Python and C languages.

Check the [demo](https://octocredi.herokuapp.com/).

## Local development

1. Open a terminal and clone this repository: ``` git clone https://github.com/youalreadydid/octocredi.git ```

2. You need Ruby 2.4+, Bundler gem, and also a recent stable Node.js (like v10) [try [RVM](https://rvm.io/) with [NVM](https://github.com/creationix/nvm) or just [asdf](https://github.com/asdf-vm/asdf)]. Go to the cloned repository and run ```bundle install -j2``` to populate your gems.

3. PostgreSQL server must be installed and a role with database creation permission must be created.

4. Configure *config/database.yml* and run ```
bundle exec rails db:create db:migrate``` to create your database.

5. Run your server with ```bundle exec rails server```.

### Running tests

After you have configured your local server, run ```bundle exec rails test```.

## How OctoCredi works

Through *GithubService*, the application gets top 5 repositories from an available language with GitHub API (*octokit* gem). The retrieved data is saved in 3 models [Repo, User, License] that can be used if GitHub API is down or the access quota is exceeded.

The application has 2 routes only:

* ```GET /``` returns the frontend;
* ```GET /repos?lang=[language]``` returns top 5 repositories of *[language]*. If language is blank, defaults to *Ruby*.

The frontend is developed in React with help of *react\_on\_rails* gem to avoid maintaining a separate client. The files are located in *app/javascript* and *package.json* in root folder.

## Heroku deployment

To deploy the application in Heroku, you will need a **PostgreSQL addon** and to **configure the sequence/order of buildpacks (in Settings tab) to have *heroku/nodejs* first then *heroku/ruby***.
