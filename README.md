## Tests for `terrgrunt plan` WITHOUT `--terragrunt-source` passing

### Works
```
git clone https://github.com/dsantanu/tf-sample-moda.git
git clone https://github.com/dsantanu/tf-sample-modb.git
git clone https://github.com/dsantanu/tg-sample-module.git
cd tg-sample-module/znp/moda/exc/
terragrunt plan --terragrunt-source ../../../../services//tf-sample-moda
```

### Does NOT Work
```
git clone https://github.com/dsantanu/tg-sample-module.git
cd tg-sample-module/znp/moda/exc/
terragrunt plan --terragrunt-log-level debug
```

### Expected Result
Terragrunt should be able to do a successful `plan/apply` without locally cloning any TF modules at all. It should download the associated TF modules directly from the upstream in the temporary location, where it should be running `terrafrom plan` form.

References:
https://github.com/gruntwork-io/knowledge-base/discussions/690
