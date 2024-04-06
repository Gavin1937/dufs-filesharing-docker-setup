
# setup scripts for [sigoden/dufs](https://github.com/sigoden/dufs) (a file sharing server with docker)

## supported os

* Ubuntu / Debian based Linux
* AWS Linux 2

## usage

### First time setup, run setup script for your os, and follow the instruction to setup a configuration file:

* Here is a table of available setup scripts

|     Script Name     |
|---------------------|
| aws-linux2-setup.sh |
| ubuntu-setup.sh     |

### Second time and later:

```sh
./run-dufs.sh
```

* This script can take an argument as the directory to share, and it will use the `config.json` file written in the location of script
  * e.g. If run command: `/home/user/repo/run-dufs.sh /home/user`
  * above command will share path `/home/user` with dufs
  * if you did not supply any argument, it will share `/home/user/repo/data` folder by default

