#!/bin/bash

echo "Downloading MongoDB"
curl "https://fastdl.mongodb.org/osx/mongodb-macos-x86_64-4.4.6.tgz" -o mongodb.tgz

echo "Extracting MongoDB"
tar -zxvf mongodb.tgz
rm -rf mongodb.tgz
echo "Enter your root password:"
sudo mv "./mongodb-macos-x86_64-4.4.6/bin/mongos" /usr/local/bin
sudo mv "./mongodb-macos-x86_64-4.4.6/bin/mongod" /usr/local/bin
sudo mv "./mongodb-macos-x86_64-4.4.6/bin/mongo" /usr/local/bin
echo "MongoDB added to PATH"

echo "Creating data and log folders and setting permissions"
sudo mkdir -p /usr/local/var/mongodb
sudo mkdir -p /usr/local/var/log/mongodb
sudo chown $USER /usr/local/var/mongodb
sudo chown $USER /usr/local/var/log/mongodb

echo "Creating mongod alias"
echo "#Added for easy mongod startup." >> /Users/$USER/.bash_profile
echo "alias mongod=\"mongod --dbpath /usr/local/var/mongodb --logpath /usr/local/var/log/mongodb/mongo.log --fork\"" >> /Users/$USER/.bash_profile

while true; do
    read -p "Do you want to install MongoDB Compass?(y/n)? " yn
    if [[ "$yn" =~ y ]]; then "./mongodb-macos-x86_64-4.4.6/bin/install_compass"; break; fi
    if [[ "$yn" =~ n ]]; then echo "MongoDB Compass won't be installed"; break; fi
done

rm -rf "./mongodb-macos-x86_64-4.4.6"
echo
echo
echo "You can now use MongoDB simply."
echo "To start MongoDB server, open up a new terminal and use \"mongod\" command."
echo "To start MongoDB client shell, use \"mongo\"."

exit

