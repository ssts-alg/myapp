#!/bin/sh -ex

if [ "${GIT_BRANCH}" == "master" ]; then
    PROFILE="prd"
    REGION="us-west-2"
    rm -f target/*tests.jar
    for AWS_ENVIRONMENT in ${AWS_ENVIRONMENTS}; do
        aws --profile ${PROFILE} --region=${REGION} s3 cp target/myapp-*.war s3://stsureshbab-987/myapp-${GIT_COMMIT:0:8}.war
    done
elif [ "${GIT_BRANCH}" == "develop" ]; then
    PROFILE="dev"
    ls
fi
