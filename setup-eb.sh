set -x
set -e

sudo touch ~/.aws/config
sudo chmod 777 ~/.aws/config
sudo echo "[profile eb-cli]" > ~/.aws/config
sudo echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> ~/.aws/config
sudo echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> ~/.aws/config