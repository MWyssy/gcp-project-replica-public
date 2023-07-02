# Container Registry

> The purpose of this module is to create the google artifact registry's to store the front and back end docker images. This is so there is an accessible location to push the images to, and later pull from, which can be done manually, or as part of a CI/CD pipeline.

## Initialisation

This module will be run when the `terraform apply` command is used in the root of the _infrastrucure_ directory. If you wish to change the names of the registry's, you can do so by editing the _fe_repo_name_ & _be_repo_name_ fields in the maint.tf file located in the root of the directory.

### Users

In order to add a new user to have access through the KMS key that controls permissions for the registry's, you can do so by adding the user to the _members_ block of the _google_kms_crypto_key_iam_binding_ resource in the _main.tf_ file of the _container-registry_ module.
