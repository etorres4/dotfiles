rg-compose() {
    if [[ -z "${1}" ]]; then
        return 1
    else
        rg "$1" **/docker-compose.yml
    fi
}
