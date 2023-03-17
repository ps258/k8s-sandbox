# k8s-sandbox, Scripts to bring tyk up in minikube

## Quickly create a namespace that runs a specific version of tyk.

* Should be really simple to get started on Linux and MacOS. 
* Checkout this repo.
* Install the dependencies
      `ksh, redis-cli, jq, envsubst, psql, yq, openssl`
* If using minikube run the following to initialise the minikube cluster
			`./ksbctl init`
* If not using minikube ensure that `kubectl` is configured for the desired K8s cluster
* To have the sandbox apply a licence, create a user and set its password create a file called `~/.tyk-sandbox` and populate it with 

```
	SBX_LICENSE=<your tyk-pro licence>
	SBX_MDCB_LICENSE=<your MDCB licence>
	SBX_USER=you.email@address.com
	SBX_PASSWORD=<base64 encoded password>
```
* Deploying with MDCB requires the MDCB license to be in `~/.tyk-sandbox` as above, but ordinary use does not.

### Quick start guide

			

			[USAGE]:
			ksbctl create -v <tyk version> -t <namespace description> [-p|-s] [-c gateway_count]
						Create a tyk instance in a namespace sandbox with the version given as a tag with -v
						-e the number of edge gateway replicas to run
						-c the number of gateway replicas to run
						-h setup the edge gateways to use https (implies -m and incompatible with -i)
						-i add the istio label to the namespace so istio is injected into the pods
						-m run MDCB and configure edge gateways
						-p deploy with postgres not mongo
						-s deploy a stand alone gateway
						-t description of the sandbox namespace
						-v version tag. The file <install-dir>/k8s-sandbox/tyk-versions.list contains the versions used
			ksbctl delete <sandbox namespace...>
						Delete the sandbox namespace given as a tag and all resources in it
			ksbctl info <sandbox namespace...>
						Print info detailed info on sandbox namespaces
			ksbctl init
						Initialise minikube to enable persistent volumes
						This only needs to be done once in a minikube cluster
			ksbctl list
						List all sandbox namespaces
			ksbctl logs <sandbox namespace> <podname>
						Tail the logs of the named pod
			ksbctl modify <sandbox namespace> <deployment name> [-c count] [-v version]
						Modify deployment named to have a new number of pods and/or pods at the named version
						-c change the deployment to have the new number of pods
						-v rollout the named version into the pods. No checking of the version is done
							 so make sure it's rigth
			ksbctl monitor <sandbox namespace> <pod name>
						Print CPU and memory usage for the containers in the pod ever 5 seconds
			ksbctl pods <sandbox namespace...>
						List pods in namespace
			ksbctl publish <sandbox namespace> <api.json ...>
						Publish the API in api.json into the sandbox
			ksbctl shell <sandbox namespace> <podname>
						Start an interactive shell in the pod.
						The pod name can be a substring of the actual name
						eg. ksbctl shell ksandbox-1 dashboard
			ksbctl start
						Start the minikube cluster if it's not running
