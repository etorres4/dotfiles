# Notify on ssh login
if [[ -n $SSH_CONNECTION ]]; then
    IP="$(echo $SSH_CONNECTION | cut -d " " -f 1)"
    HOSTNAME=$(hostname)
    NOW=$(date +"%e %b %Y, %a %r")
    EMAIL='erictorres4@pm.me'
    echo "Login from ${IP} on ${HOSTNAME} on ${NOW}" | neomutt -s 'SSH Login Notification' "${EMAIL}" 2>/dev/null
fi
