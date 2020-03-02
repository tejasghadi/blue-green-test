cd /var/www/apps/hello-world

aws ssm get-parameters-by-path --region us-west-2 --path /hello-world/production/ --with-decryption \
  --query "Parameters[*].{Name:Name,Value:Value}" | jq -c '.[]' \
  |  while read i; do  \
  key=$(echo $i | jq '.Name'| sed -e 's/^"//' -e 's/"$//')  \
  value=$(echo $i | jq '.Value'| sed -e 's/^"//' -e 's/"$//'); echo $key=$value >> .env; done

bash -lc "bundle exec rails server -d -p 80 -b 0.0.0.0"