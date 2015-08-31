see https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one

```bash
vagrant package --output centos7-hdp-base.box
vagrant box add centos7-hdp-base centos7-hdp-base.box --force
```
