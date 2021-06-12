# macOS MongoDB Installer
A simple bash script for installing MongoDB on macOS.\
It downloads the tarball, extracts it, moves the binaries to the path, creates log and data files, creates an alias for easy mongod startup, and lastly installs MongoDB Compass if you want.
### Usage
```bash
bash -c "$(curl https://raw.githubusercontent.com/electromeow/macos-mongodb-installer/master/macos-mongodb-installer.sh)"
```
### Warning
Works for macOS 10.13 and higher.
### LICENSE
This project is published under MIT license.

