# Paradise Charity ![example branch parameter](https://github.com/github/docs/actions/workflows/main.yml/badge.svg?branch=feature-1)
This project is just a complete and sample project. I try to implement this project in various way.<br>
This project in based on **Django** framework, and in addition for implementing database manually, I use go programming language.

![Alt Text](./doc/intro_char.png)
## Install Django from scratch

First clone the project

    git clone https://github.com/armin-azh/paradiseCharity.git
### Install conda environment

    conda create -n your-env-name python=3.7

And then

    conda activate your-env-name

### Install pure python environment

    python -m env your-env-name

And then 

    source path-to-your-env/activate    

### Install packages

    pip install -r requirement.txt

## Run
### Development mode

    export DJANGO_SETTINGS_MODULE=paraserver.settings.productions
    export DATABASE_URL=postgresql://username:password@localhost:5432/db_name
### Deployment mode

    export DJANGO_SETTINGS_MODULE=paraserver.settings.dev

### Migrate and migration

    python manage.py makemigrations
    python manage.py migrate

### Run the server

    python manage.py runserver

## Migrate database manually
In this section, we can use go programming language for migrate our database without using django migrate.

> Note: for doing this section we should install the go before

First go to the deployment folder, and then

    go build main.go -o your-execution-filename

After the source code compilation

    ./you-execution-filename

## Database diagram
### class diagram
![Alt Text](./doc/class_diagram.png)
### DFD
#### Level 0
![Alt Text](./doc/dfd_level0.png)
#### Level 1
![Alt Text](./doc/dfd_level1.png)
### ER diagram
![Alt Text](./doc/erd_diagram.png)
### Signup activity diagram
![Alt Text](./doc/signup_activity.png)
### Signup use case diagram
![Alt Text](./doc/signup_usecase.png)
### Prepare order sequence diagram
![Alt Text](./doc/prepare_sequence_diagram.png)
### Prepare order state diagram
![Alt Text](./doc/prepare_state_diagram.png)

## Technologies

- Heroku
- Postgres
- Wagtail
- Python
- Go
- Docker