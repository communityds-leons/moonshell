#!/usr/bin/env bash
#
# AWS FUNCTION LOADING
#
for aws_file in $(find "${MOON_LIB}/aws/" ${MOON_FIND_OPTS} -name '*.sh'); do
    source ${aws_file}
done

# This is sensitive information. Set it as an array in etc/profile.d/private/
# which is .gitignored
aws_accounts () {
    if [[ -z ${AWS_ACCOUNTS[@]-} ]]; then
        echoerr "ERROR: \${AWS_ACCOUNTS[@]} is unset."
        return 1
    else
        echo ${AWS_ACCOUNTS[@]}
    fi
}

