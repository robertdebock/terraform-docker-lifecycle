# Terraform Lifecycle demo

Plan & apply:

You can set the deployment_version to `1` or `2`. This makes it posible to spin up an extra instance before removing the old one. This number is used to prevent conflicts in name and port.

```shell
terraform plan -var="deployment_version=2"
terraform apply -var="deployment_version=2"
terraform destroy -var="deployment_version=2"
```

## Monitoring

Although a container takes a moment to start
Because this container takes a moment to become avaialble, the service may still be in a failed state.

```shell
while [ 1 ] ; do for deployment_version in 1 2 ; do curl -k https://localhost:844${deployment_version} > /dev/null 2>&1 ; if [ $? = 0 ] ; then echo -n "${deployment_version}: OKAY " ; else echo -n "${deployment_version}: FAIL " ; fi ; done ; echo ; done
```

A production application would require some kind of a [service mesh](https://en.wikipedia.org/wiki/Service_mesh) to publish the application and attract traffic.
