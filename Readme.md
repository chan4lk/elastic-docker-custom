# Custom Elastic Search Image with Azure Repository

1. Elastic Username : `elastic`
1. Elastic Password : `XdQrejJIMasJZyyw4KQl`

3. Create Repo

```shell
PUT _snapshot/az_repo
{
  "type": "azure",
  "settings": {
    "container": "es-backups",
    "base_path" : "docker-cluster"
  }
}
```

4. Create snapshot
```shell
PUT _snapshot/az_repo/my_snapshot?wait_for_completion=true
```