# binaryabacus-ghost

> Ghost server for binraryabacus.io on Heroku

## Gettting Started

### Local

- `make init` to download and unzip ghost.zip. Only necessary if upgrading ghost
- `make install start` to serve the site locally in dev mode at http://127.0.0.1:2368/
- `make start-prod` to serve the site in production mode (doesn't work ATM)

### Heroku

- `make config` to set PostgresSQL config from https://postgres.heroku.com/databases/binaryabacus/gold
- `make deploy` to deploy changes to heroku
- `make restart` to restart all dynos
- `make logs` to tail the logs

## Reference

- http://shuvankar.com/install-ghost-heroku/
