[![CircleCI](https://circleci.com/gh/cp3402-students/a2-cp3402-2019-team25/tree/master.svg?style=svg)](https://circleci.com/gh/cp3402-students/a2-cp3402-2019-team25/tree/master)

# Installation

Run install.sh to install .git hooks. Add github ssh key named id_rsa to the .ssh folder.

# Usage

On push, it will test deploy a staging server using CircleCI.
To test out the website, re-run the job with SSH enabled, and run connect_to_webserver.sh. This will let you access the site via localhost:80.

On pre-commit, the database, plugins, and themes will be updated to the latest commit of their master branch.

# Project Development
[Local Development Environment](https://github.com/cp3402-students/env-cp3402-2019-team25)

[Database](https://github.com/Xett/database-cp3402-2019-team25)

[Theme](https://github.com/Xett/theme-cp3402-2019-team25)

The local Database repository in the Local Development Environment should be used to update the Database, Themes and Plugins. There is no other cloning needed, besides cloning the dev environment.

Submodules are automatically updated along the master branch.
