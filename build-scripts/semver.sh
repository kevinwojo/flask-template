#!/bin/bash

VERSION_FILE=VERSION
FILE_CONTENTS=$(cat ${VERSION_FILE})
CURRENT_VERSION=${CURRENT_VERSION:-$FILE_CONTENTS}
COMMITTED="false"

##### Logic
function check_current_version() {
    current_version=$CURRENT_VERSION
}

function parse_version() {
    patch=$(echo ${current_version} | awk --field-separator='.' '{ print $3}')
    minor=$(echo ${current_version} | awk --field-separator='.' '{ print $2}')
    major=$(echo ${current_version} | awk --field-separator='.' '{ print $1}')
}

function bump_patch() {
    let "patch = $patch + 1"
}

function bump_minor() {
    let "minor = $minor + 1"
}

function bump_major() {
    let "major = $major + 1"
}

function build_new_version() {
    new_version="${major}.${minor}.${patch}"
}
##### end Logic


#
# Reading
#
check_current_version
parse_version


#
# Version incrementing
#
if [ "${1}" = "release-major" ];
then
    bump_major
elif [ "${1}" = "release-minor" ];
then
    bump_minor
elif [ "${1}" = "release-patch" ];
then
    bump_patch
fi
build_new_version

#
# Git operations
#
if [ "${2}" = "commit" ];
then
    echo "${new_version}" > ${VERSION_FILE} && \
    git commit --quiet ${VERSION_FILE} -m "[${new_version}] Release version" && \
    git push --quiet && \
    git tag v${new_version} && \
    git push --quiet origin v${new_version} && \
    COMMITTED="true"
fi


echo "{\"current\":\"${current_version}\",\"new\":\"${new_version}\",\"committed\":\"${COMMITTED}\"}" 
