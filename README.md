
# terraform-102

## Usage

### Install Terraform (Mac)

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

terraform version
```

## Make sure Docker is running

### See if the docker daemon is running

```sh
docker ps
```

### Install Docker Desktop

If you need to install docker:

* https://docs.docker.com/desktop/install/mac-install/

### Open Docker Desktop

This will start the docker daemon if it isn't running:

```sh
open -a Docker
```

Check it again:

```sh
docker ps
```

## Kubernetes

### Enable Kubernetes

* Docker Desktop / Preferences 
* Enable Kubernetes
* Be sure to Apply and Restart

### Install kubectl

See: https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/

## Terraform

### Init the plan

```sh
terraform init
``` 

### Run the plan

```sh
terraform plan
```

### Apply the plan

```sh
terraform apply
```

### Verify the server is up

Check to see that the pod is running:

```sh
kubectl get pod
```

Expected:

```sh
NAME                READY     STATUS    RESTARTS   AGE
terraform-example   1/1       Running   1          80s
```

### Find the NodePort

```sh
kubectl get svc terraform-example -o jsonpath='{.spec.ports[0].nodePort}'
```

```sh
open http://localhost:(PORT RETURNED ABOVE)
```

### Destroy the plan

```sh
terraform destroy
```

### Verify the container is gone

```sh
docker ps
```

## kubectl commands

```sh
kubectl get svc terraform-example -o jsonpath='{.spec.ports[0].nodePort}'
```

```sh
kubectl get services

NAME                TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes          ClusterIP   10.96.0.1        <none>        443/TCP        179m
terraform-example   NodePort    10.103.222.154   <none>        80:30590/TCP   117s
```

Note that in this example 30590 is the nodeport

## References

* https://kubernetes.io/docs/reference/kubectl/cheatsheet/
* https://medium.com/@naswani91/in-this-blog-we-will-discuss-what-is-terraform-kubernetes-provider-how-to-use-it-and-difference-f576158b1531
* https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
* https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service
* https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
* https://gist.github.com/ivaravko/501b4e8e5f1bc1bf5fecd149186b99b9
* https://developer.hashicorp.com/terraform/cli/commands/plan
* https://spacelift.io/blog/terraform-plan
* https://developer.hashicorp.com/terraform/downloads
* https://hub.docker.com/r/mitchallen/random-server
* https://dev.to/pavanbelagatti/using-terraform-to-manage-infrastructure-resources-32da
* https://dockerlabs.collabnix.com/advanced/automation/terraform/terraform-mac-nginx.html
* https://developer.hashicorp.com/terraform/tutorials/docker-get-started/docker-build
* https://stackoverflow.com/questions/73451024/where-to-find-information-about-the-following-terraform-provider-attribute-depre
* https://raw.githubusercontent.com/github/gitignore/main/Terraform.gitignore
