#!/bin/sh -ex


aws configure set prd.region us-west-2

if [ "${GIT_BRANCH}" == "origin/master" ]; then
    PROFILES="prd"
    REGION="us-west-2"
    for PROFILE in ${PROFILES}; do
        aws --profile ${PROFILE} --region=${REGION} s3 cp target/myapp-*.war s3://stsureshbab-987/myapp-${GIT_COMMIT:0:8}.war
    done
elif [ "${GIT_BRANCH}" == "origin/develop" ]; then
    PROFILE="dev"
    ls
fi
