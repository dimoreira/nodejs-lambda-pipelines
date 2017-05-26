# NodeJS Lambda Pipelines

This is a custom image for projects using [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) containing NodeJS 6.10 and MongoDB.

Docker Hub: https://hub.docker.com/r/dimoreira/nodejs-lambda-pipelines/

## Using

Just add the Docker Hub image directly to your `bitbucket-pipelines.yml` file:

```yaml
image: dimoreira/nodejs-lambda-pipelines
pipelines:
	default:
		- step:
			script:
				- "node --version"
				- "npm --version"
				- "npm install"
				- "npm test"
```

And commit the change to your repository to use the new image on the build step.

## Development

To test the image locally or bring updates, just clone the project and run the docker build command with the Dockerfile:

```bash
$ git clone https://github.com/dimoreira/nodejs-lambda-pipelines.git
$ cd nodejs-lambda-pipelines
$ docker build .
```
