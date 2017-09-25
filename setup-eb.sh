set -x
set -e

sudo mkdir -p /home/ubuntu/.aws
sudo touch /home/ubuntu/.aws/config
sudo chmod 600 /home/ubuntu/.aws/config
sudo echo "[profile eb-cli]" > /home/ubuntu/.aws/config
sudo echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> /home/ubuntu/.aws/config
sudo echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> /home/ubuntu/.aws/config