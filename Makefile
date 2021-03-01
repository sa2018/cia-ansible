CONTAINER_IMAGE := ansible-assignment
DOCKER_ARGS := -v $(PWD):/opt/ansible -v $(HOME)/.ssh/ansible-assignment.pem:/root/.ssh/id_rsa -v $(HOME)/.gitconfig:/root/.gitconfig

image: ## Creates workspace docker image
	docker build $(PWD) -t ansible-assignment

shell: ## Creates workspace container
	docker run -ti --rm  ${DOCKER_ARGS} ansible-assignment /bin/bash

lint: ## Run ansible lint
	@ansible-lint --nocolor -f plain src/webserver.yml

pre-commit: lint ## Run pre commit actions

help: ## Available commands
	@printf "\033[32mMakefile : \033[0m\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'
