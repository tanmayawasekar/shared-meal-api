set -x
set -e

sudo mkdir -p /home/ubuntu/.aws
sudo touch /home/ubuntu/.aws/config
sudo chmod 777 /home/ubuntu/.aws/config
sudo echo "[profile eb-cli]" > /home/ubuntu/.aws/config
sudo echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> /home/ubuntu/.aws/config
sudo echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> /home/ubuntu/.aws/config

eb init -r ap-south-1 -e ShareAMeal-env -I AKIAJSMQGR2672J7QEYQ -S 6XaahCe2qBoYB3y7B/88WN+lP823tUyJUhZSWGbR share-a-meal-api  