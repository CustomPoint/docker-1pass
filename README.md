# Using 1Password Docker Style
## Building the app
All you need to do is run the docker-compose:

    docker-compose build

This will create a docker image with name: `1passcli`
With this image you can connect to 1password with any account and query, create, delete or download items from vaults.

## Working with the Entrypoint
The `entrypoint.sh` is defined in the Dockerfile as being the Entrypoint when running the container.
This container will have an instance of the entrypoint.sh in its FS. This is copied at build time.
Changing the entrypoint would mean another build of the docker image.

Finally, the `entrypoint.sh` is driven by environment variables.
The suggestion of using this or any other Entrypoint for that matter is to use an environment file like: `env.list`
This file is ignored when committing.

Example of an env.list contents:

    DOMAIN=domain.1password.com
    USER=cosmin
    SECRET_KEY=xxx
    PASS=password

## Spinning up the docker container
A suggestion for executing the docker container so that it will execute the `entrypoint.sh` with the `env.list` (the environment file) specified.

    docker run --rm --env-file env.list -h 1passcli 1passcli

> Note: Please use 1passcli as the hostname for the container so we know if there are weird login behaviors.

If the `env.list` file is avoided than the `entrypoint.sh` execution will let you use the cli directly but that will not guarantee correct functionality.
