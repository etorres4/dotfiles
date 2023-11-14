# Update a docker container using docker compose
#
# Run this command safely by:
#   - Ensuring the docker binary exists
#   - The docker-compose.(yml|yaml) file is readable
#   - Waiting 5 seconds between docker compose pulls to avoid being rate limited
dockerupdate() {
    # If either docker is not installed or docker-compose file is missing, do not run
    if [[ ! -x "$(which docker)" ]] && ([[ ! -r docker-compose.yml ]] || [[ ! -r docker-compose.yaml ]]); then
        return 1
    else
        until docker compose pull; do
            docker compose pull
            # Do not run this command too often
            sleep 5
        done
        docker compose up -d
    fi
}
