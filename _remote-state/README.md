# Remote State

> This module's purpose is to create the remote state storage bucket for the main 'infrastructure' to use. Once created, you should not need to to do anything else with the '\_remote-state' module.

## Instructions

To set up the remote state, you need to run `terraform init` to first initialise the terraform state. If this is the first time that a Google KMS key has been used in the project, then you will need to authorise the projects use of the key management system with the following command:

```
gsutil kms authorize -p <project-id> -k projects/<project-id>/locations/<project-region>/keyRings/<project-keyring-id>/cryptoKeys/<project-key-id>
```

Once the use of KMS has been authorised, you can run `terraform apply` to create the remote state bucket. This module will output the id of the newly created bucket for the use of the main 'infrastructure' module.
