EXEC := run
help:
	@printf "%-20s %s\n" "------ Makefile Commands --------"
	@printf "%-20s %s\n" "Target" "Description"
	@printf "%-20s %s\n" "------" "-----------"
	@make -pqR : 2>/dev/null \
	| awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' \
	| sort \
	| egrep -v -e '^[^[:alnum:]]' -e '^$@$$' \
	| xargs -I _ sh -c 'printf "%-20s " _; make _ -nB | (grep -i "^# Help:" || echo "") | tail -1 | sed "s/^# Help: //g"'
	@./${EXEC} help

install:
	@# Help: Downloads dependencies
	./${EXEC} install

build:
	@# Help: Builds project 
	./${EXEC} build

test:
	@# Help: Runs tests
	./${EXEC} test

test1:
	@# Help: github/cloudinary_npm
	./${EXEC} https://github.com/cloudinary/cloudinary_npm

test2:
	@# Help: npmjs/express
	./${EXEC} https://www.npmjs.com/package/express

git: clean
	@# Help: Automates the git push workflow
	$(eval MESSAGE := $(shell bash -c 'read -p "commit -m " message; echo $$message'))
	@git add .
	@git status
	$(if $(strip $(MESSAGE)), git commit -m "$(MESSAGE) -$(shell whoami)", git commit -m "$(shell date +'%m-%d-%Y %H:%M:%S') -$(shell whoami)")
	@git pull
	@git push

pull:
	@# Help: Pulls from github
	@git pull

# EXAMPLE @rm -rf ________ || true
clean:
	@# Help: Removes unnecessary files 

.PHONY: help install build test git pull clean