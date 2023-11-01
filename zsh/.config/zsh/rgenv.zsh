# Case-insensitive filter for environment variables
rgenv() {
    if [[ -n $1 ]]; then
        env | rg --ignore-case $1
    else
        return 0
    fi
}
