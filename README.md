# binaryabacus-ghost

> Ghost server for binraryabacus.io deployed on Heroku

## Gettting Started

### Local

- `make init` to download and unzip ghost.zip. Only necessary if upgrading ghost.
- `make install` to install dependencies for local dev, and runs `make theme` through `npm run postscript`
- `make theme` to compile the theme and symlink the theme folder from `node_modules` to `content/themes/binaryabacus-theme`
- `make start` to serve the site locally in dev mode at http://127.0.0.1:2368/
- `make start-prod` to serve the site in production mode (doesn't work ATM)

### Heroku

- `make config` to set PostgresSQL config from https://postgres.heroku.com/databases/binaryabacus/gold
- `make deploy` to deploy changes to heroku, and installs the latest theme from https://github.com/felixlaumon/binaryabacus-theme
- `make restart` to restart all dynos
- `make logs` to tail the logs

## Reference

- http://shuvankar.com/install-ghost-heroku/
