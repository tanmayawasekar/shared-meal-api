# deploy.sh
#!/bin/bash
# name of the deploy image on quay.io
BUILD="tanmayawasekar/share-a-meal-api:%CIRCLE_PREVIOUS_BUILD_NUM%"

# deploy tag
SHA1=$CIRCLE_PREVIOUS_BUILD_NUM

# elastic beanstalk environment to deploy
EB_ENV=$2
APP_NAME="ShareAMeal-env"

# Create application version from Dockerrun file
echo "creating new Elastic Beanstalk version"
aws elasticbeanstalk create-application-version \
  --application-name $APP_NAME \
  --version-label $SHA1 \
  --source-bundle S3Bucket=$EB_BUCKET,S3Key=$PREFIX/$DOCKERRUN_FILE

# Update Elastic Beanstalk environment to new version
echo "updating Elastic Beanstalk environment"
aws elasticbeanstalk update-environment \
  --environment-name $EB_ENV \
  --version-label $SHA1