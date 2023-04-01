# Tests for `terrgrunt plan` WITHOUT `--terragrunt-source` passing

## Works
```
cd tg-modules/moda
terragrunt run-all --terragrunt-source $(pwd)/../../services/tf-service-modb  plan  --terragrunt-log-level debug
```

## Does NOT Work
```
cd tg-modules/moda
terragrun plan
```

References:
https://github.com/gruntwork-io/knowledge-base/discussions/690
