This is an example EKS deployment using Cloudformation and the deployer project for deploying CFN templates to your account.

[]: # Prerequisites
 1. Install [deployer](https://github.com/RightBrain-Networks/deployer/tree/development/deployer)
 2. Install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
 3. Install [aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
 4. Install [helm](https://helm.sh/docs/intro/install/)
 5. Install [awscli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

scripts directory
 1. Obtain the thumbprint from the OIDC IdP certificates for the EKS cluster
 2. Update CoreDNS to run on EKS Fargate using the thumbprint from step 1

[]: # Deploying the EKS cluster
  1. Run the deployer command to deploy the EKS cluster
    - `deployer -x upsert -c config/shared.yaml -s eks -yD`
  2. Run the scripts/obtain-oidc-thumbprint.sh script to obtain the thumbprint from the OIDC IdP certificates for the EKS cluster
  3. Update the EKS cluster to use the thumbprint from step 2 and redeploy the EKS cluster
    - `deployer -x upsert -c config/shared.yaml -s eks -yD`
  4. Run the scripts/update-coredns-fargate.sh script to update CoreDNS to run on EKS Fargate using the thumbprint from step 3