# Supported tags and respective `Dockerfile` links

# What is JIRA Mattermost Webhook Bridge?

[Mattermost](https://www.mattermost.org/) is an open source, self-hosted [Slack](https://slack.com/) -alternative. This is an dockerised [JIRA Webhook Bridge for Mattermost](https://www.mattermost.org/community-applications/).

> [wikipedia.org/wiki/Jira_(software)](https://en.wikipedia.org/wiki/Jira_(software))

> [mattermost.org](https://www.mattermost.org)

<img src="jira-logo.png" alt="JIRA Software Logo" width="450px"/> <img src="mattermost-logo.png" alt="Mattermost Logo" width="450px"/>

# How to use this image.

This image is based on official [node:latest](https://github.com/nodejs/docker-node/blob/ae9e2d4f04a0fa82261df86fd9556a76cefc020d/6.3/Dockerfile) which installs latest version of Node and hosts [JIRA Mattermost Webhook Bridge](https://github.com/vrenjith/jira-matter-bridge) in order to integrate JIRA with Mattermost. 

### Credits
We want to give credit to following Docker images that has been used as inspiration of Mattermost webhook:
- [vrenjith/jira-matter-bridge](https://github.com/vrenjith/jira-matter-bridge)

### How to run this image

Note that prerequisite to run this Webhook Bridge is that you have already set up and run [Docker Mattermost Server](https://github.com/mattermost/mattermost-docker) . 

```console
$ docker run -d -p 81:3000 --name jira-matter-bridge \
-e "MATTERMOST_SERVER_PORT=80" \
-e "MATTERMOST_SERVER_PATH=/hooks/" \
-e "MATTERMOST_SERVER_PROTO=http" \
-e "MATTERMOST_SERVER=localhost" \
acntech/adop-mattermost-jira
```

You can verify that the JIRA Webhook Bridge is running by entering http://localhost:81.

Environment Variables:

`MATTERMOST_SERVER_PORT`      : The port which Mattermost Server is running at

`MATTERMOST_SERVER_PATH`      : The path to the hooks at Mattermost Server

`MATTERMOST_SERVER_PROTO`     : http og https for Mattermost Server

`MATTERMOST_SERVER`           : Hostname/IP of Mattermost Server

#### Create Mattermost Incoming WebHook ID
1. Log in as admin to Mattermost
1. Main menu > Integrations > Incoming Webhooks
1. Add Incoming Webhook
1. Fill out Display Name, Description and choose Channel to send notifications to
1. Note the mattermost hook id (the part that appears after hooks in the hook URL.

#### Configure JIRA Webhook to forward the hook 
1. Log in as admin to JIRA Software
1. Go to System > WebHooks
1. Create a WeebHook
1. URL = `http://localhost:81/hooks/<mattermost hook id>`

# License

This image is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE.txt) for the full license text.

# Supported Docker versions

This image is officially supported on Docker version 1.12.

Support for older versions (down to 1.6) is provided on a best-effort basis.

Please see [the Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

# User Feedback

## Documentation

Documentation for this image is currently only in this [README.md](README.md) file. Please support us keeping documentation up to date and relevant.

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/acntech/docker-mattermost-jira/issues)

You can also reach image maintainers mentioned in the [Dockerfile](Dockerfile).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/acntech/docker-mattermost-jira/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

Please make sure to raise a Pull Request for your changes to be merged into master branch.

### Recommended Reading
- [JIRA Mattermost Webhook Bridge](https://github.com/vrenjith/jira-matter-bridge)
- [Mattermost Integration Settings](https://docs.mattermost.com/help/settings/integration-settings.html)
- [Mattermost Incoming Webhooks](https://docs.mattermost.com/developer/webhooks-incoming.html)
