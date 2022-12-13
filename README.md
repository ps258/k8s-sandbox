# k8s-sandbox, Scripts to bring tyk up in minikube

## Quickly create a namespace that runs a specific version of tyk.

* Should be really simple to get started on Linux and MacOS. 
* Checkout this repo.

### Quick start guide

			[USAGE]:
			ksbctl create -v <tyk version> -t <namespace description> [-p|-s] [-c gateway_count]
						Create a tyk instance in a namespace sandbox with the version given as a tag with -v
						-e the number of edge gateway replicas to run
						-c the number of gateway replicas to run
						-m run MDCB and configure edge gateways
						-p deploy with postgres not mongo
						-s deploy a stand alone gateway
						-t description of the sandbox namespace
						-v version tag. The file /home/pstubbs/code/k8s-sandbox/tyk-versions.list contains the versions used
			ksbctl delete <sandbox namespace>
						Delete the sandbox namespace given as a tag and all resources in it
			ksbctl info <sandbox namespace>
						Print info on the particular sandbox namespace
			ksbctl list
						List all sandbox namespaces
			ksbctl logs <sandbox namespace> <podname>
						Tail the logs of the named pod
			ksbctl modify <sandbox namespace> <deployment name> [-c count] [-v version]
						Modify deployment named to have a new number of pods and/or pods at the named version
						-c change the deployment to have the new number of pods
						-v rollout the named version into the pods. No checking of the version is done
							 so make sure it's rigth
			ksbctl shell <sandbox namespace> <podname>
						Start an interactive shell in the pod.
						The pod name can be a substring of the actual name
						eg. ksbctl shell ksandbox-1 dashboard

