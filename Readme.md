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

5. Schedule backups
```shell
PUT _slm/policy/nightly-snapshots
{
  "schedule": "0 25 22 * * ?",
  "name": "<nightly-snap-{now/d}>",
  "repository": "az_repo",
  "config": {
    "indices": "*",
    "include_global_state": true,
    "feature_states": [
      "kibana",
      "security"
    ]
  },
  "retention": {
    "expire_after": "30d",
    "min_count": 5,
    "max_count": 50
  }
}
```