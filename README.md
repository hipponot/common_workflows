# common_workflows



## To add precommit hooks

```shell
pre-commit install --hook-type  commit-msg --hook-type pre-commit
```


Creating pre-commit hooks

[helpful reference](https://stefaniemolin.com/articles/devx/pre-commit/hook-creation-guide/)

[also this](https://stefaniemolin.com/articles/devx/pre-commit/troubleshooting-guide/)

to add version

```shell
git tag <version>
git push origin tag <version>
```
