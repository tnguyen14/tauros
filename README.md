# Jenkins running inside a Docker container

## Usage

- List of plugins that would come pre-installed in `plugins.txt`

- Create a `docker-compose.override.yml` to specify port binding
    ```
	version: '2'
	services:
	  jenkins:
	    ports:
	      - "80:8080"
	```

- `docker-compose up -d`
