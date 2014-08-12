# Symlink theme from node_modules to content/themes
theme = $(shell cd node_modules/binaryabacus-theme; pwd)
ifeq ($(HOME), /app)
	# Harcode path on Heroku
	theme = /app/node_modules/binaryabacus-theme
endif

all: 

init:
	curl -L mhttps://ghost.org/zip/ghost-0.5.0.zip > ghost.zip
	unzip ghost.zip
	rm ghost.zip

install:
	npm install
	heroku plugins:install https://github.com/heroku/heroku-repo.git

theme:
	-rm content/themes/binaryabacus-theme
	cd node_modules/binaryabacus-theme; make
	ln -s $(theme) content/themes/binaryabacus-theme

start:
	npm start

start-prod:
	NODE_ENV=production PORT=2369 node index.js

heroku-link:
	-heroku git:remote -a binaryabacus

deploy: heroku-link
	-cd node_modules/binaryabacus-theme; git push
	git push heroku master -f

config: heroku-link
	# https://postgres.heroku.com/databases/binaryabacus/gold
	@read -r -p "Set Postgres Host: " HOST; \
	heroku config:set POSTGRES_HOST=$$HOST

	@read -r -p "Set Postgres User: " USER; \
	heroku config:set POSTGRES_USER=$$USER

	@read -r -p "Set Postgres Password: " PASSWORD; \
	heroku config:set POSTGRES_PASSWORD=$$PASSWORD

	@read -r -p "Set Postgres Database: " DATABASE; \
	heroku config:set POSTGRES_DATABASE=$$DATABASE

logs: heroku-link
	heroku logs -t

restart: heroku-link
	heroku restart

rebuild:
	heroku repo:rebuild

.PHONY: init install start start-prod heroku-link deploy config logs restart theme
