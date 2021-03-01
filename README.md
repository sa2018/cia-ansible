# oflaic-ansible assignment

- Added [docker](./Dockerfile) container to use as workspace (no host dependencies other then docker).
- [Makefile](./Makefile) for the convenience.
- Added [ansible-lint](https://ansible-lint.readthedocs.io/en/latest/) for linting.
- Used amazon linux 2 as target host/
- Used dummy nuxt.js built as SPA.

## Roles

### nginx
Install nginx, currently only amazon-linux 2 supported.

### app
Deploys the artifact file located inside the repo into host.

## Host groups

### webserver
Web Server hosts

#### Group Vars
- server_hostname : Server host name for nginx host 
- artifact_id: short commit hash of artifact

## Folder Structure
```bash
├── artifacts                  # Temp folder for demo app
├── Dockerfile
├── Makefile
├── README.md
├── requirements.txt
└── src
    ├── inventory               # Inventory and var files for the ${ENV}
    │   └── prod
    │       ├── group_vars
    │       │   └── webservers
    │       ├── host_vars
    │       └── hosts
    ├── roles                   # Roles folder
    │   ├── nginx
    │   │   ├── handlers
    │   │   │   └── main.yml
    │   │   ├── tasks
    │   │   │   ├── amazon.yml
    │   │   │   └── main.yml
    │   │   └── templates
    │   │       └── nginx.conf
    │   └── spa
    │       ├── meta
    │       │   └── main.yml
    │       └── tasks
    │           └── main.yml
    └── webserver.yml           # Playbook
```
## Development

**Some of the tasks requires inventory file which taken from ${ENV} variable inventory/${ENV} should exists. Currently only prod folder exists but can add stg, dev and such.**

### Make commands

#### Get help
```bash
make help
```

####  Run pre commit actions
```bash
make pre-commit
```

#### Create docker image 
```bash
make container
```

#### Get workspace
```bash
make shell
```

#### Run web server playbook
```bash
export ENV="prod"
make shell
```
or
```bash
ENV="prod" make shell
```
