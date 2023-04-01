## Tests for `terrgrunt plan` WITHOUT `--terragrunt-source` passing

### Works
```
cd tg-modules/moda
terragrunt run-all --terragrunt-source $(pwd)/../../services/tf-service-modb  plan  --terragrunt-log-level debug
```

### Does NOT Work
```
git clone https://github.com/dsantanu/tg-sample-module.git
cd tg-sample-module/znp/moda/exc/
terragrunt plan --terragrunt-log-level debug
```

References:
https://github.com/gruntwork-io/knowledge-base/discussions/690
