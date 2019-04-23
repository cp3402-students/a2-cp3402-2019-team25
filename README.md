# Usage
Run install.sh to install .git hooks. Add github ssh key named id_rsa to the .ssh folder.

On push, it will test deploy a staging server using CircleCI.
To test out the website, re-run the job with SSH enabled, and run connect_to_webserver.sh. This will let you access the site via localhost:80.

On pre-commit, the database, plugins, and themes will be updated to the latest commit of their master branch.
