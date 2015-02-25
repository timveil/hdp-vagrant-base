see [](https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one)

```bash
vagrant package --output centos6.6-hdp-base.box
vagrant box add centos6.6-hdp-base centos6.6-hdp-base.box --force
```
