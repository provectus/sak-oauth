# OAuth2 Proxy

This module is part of Swiss Army Kube project. Checkout main repository and contributing guide below.

**[Swiss Army Kube](https://github.com/provectus/swiss-army-kube)**
|
**[Contributing Guide](https://github.com/provectus/swiss-army-kube/blob/master/CONTRIBUTING.md)**

## Example

```hcl
module oauth {
  depends_on     = [module.argocd]
  source         = "github.com/provectus/sak-oauth"
  cluster_name   = module.kubernetes.cluster_name
  namespace_name = "oauth"
  domains        = local.domain
  argocd         = module.argocd.state
  client_id      = "exampleid"
  client_secret  = "examplesecret"
  cookie_secret  = "examplecookie"
}
```

Read more about google oauth app [here](https://docs.github.com/en/developers/apps/building-oauth-apps)

Add ingress annotation to you service for auth mode enabled

```hcl
    "kubernetes.io/auth-url"     = "https://oauth2.${local.domain[0]}/oauth2/auth"
    "kubernetes.io/auth-signin"  = "https://oauth2.${local.domain[0]}/oauth2/sign_in?rd=https://$host$request_uri"
```

## Requirements

```
terraform >= 1.1
```

## Inputs

| Name              | Description                                                                                         | Type           | Default            | Required |
| ----------------- | --------------------------------------------------------------------------------------------------- | -------------- | ------------------ | :------: |
| argocd            | A set of values for enabling deployment through ArgoCD                                              | `map(string)`  | `{}`               |    no    |
| client_id         | Client id for oauth                                                                                 | `string`       | `""`               |    no    |
| client_secret     | Client secrets for oauth                                                                            | `string`       | `""`               |    no    |
| cluster_name      | The name of the cluster the charts will be deployed to                                              | `string`       | n/a                |   yes    |
| conf              | A set of parameters to pass to chart                                                                | `map`          | `{}`               |    no    |
| cookie_secret     | random_string make gen command python -c 'import os,base64; print base64.b64encode(os.urandom(16))' | `string`       | `""`               |    no    |
| domains           | A list of domains to use                                                                            | `list(string)` | `[]`               |    no    |
| module_depends_on | A list of explicit dependencies for the module                                                      | `list`         | `[]`               |    no    |
| namespace         | A name of the existing namespace                                                                    | `string`       | `""`               |    no    |
| namespace_name    | A name of namespace for creating                                                                    | `string`       | `"ingress-system"` |    no    |

## Outputs

No output.
