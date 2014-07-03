all: 

init:
	curl -L mhttps://ghost.org/zip/ghost-0.4.2.zip > ghost.zip
	unzip ghost.zip
	rm ghost.zip

install:
	npm install

start:
	npm start

start-prod:
	NODE_ENV=production node index.js

heroku-link:
	-heroku git:remote -a binaryabacus

deploy: heroku-link
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

.PHONY: init install start start-prod heroku-link deploy config logs restart
