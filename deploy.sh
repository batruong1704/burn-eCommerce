echo "## 1/5. Upgrade site"
php bin/magento setup:upgrade

echo "## 2/5. Di compile"
bin/magento setup:di:compile

echo "## 3/5. Static content deploy"
bin/magento setup:static-content:deploy -f

echo "## 4/5. Flush cache"
bin/magento cache:flush

echo "## 5/5. Setup permission"
sh ./ set-permission.sh
