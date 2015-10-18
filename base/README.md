before packaging box, make sure to change both `vagrant` and `root` password to `vagrant`

```bash
sudo su -

# change root password
passwd 

# change vagrant password
passwd vagrant
```

see https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one

```bash
vagrant package --output centos7-hdp-base.box
vagrant box add centos7-hdp-base centos7-hdp-base.box --force
```
