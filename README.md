# Chefserver
Terraform automation for chef server

#### Manual steps
- Create user
```
sudo chef-server-ctl user-create admin admin admin 123@gmail.com mypassword -f admin.pem
```

- Create org
```
sudo chef-server-ctl org-create myorg "myorg" --association_user admin -f myorg-validator.pem
```
