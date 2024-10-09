# k8s-sandbox, Scripts to bring tyk up in minikube

## Quickly create a namespace that runs a specific version of tyk.

* Should be really simple to get started on Linux and MacOS. 
* Checkout this repo.
* Install the dependencies
      `ksh, minikube, jq, envsubst, yq, openssl`
* If using minikube run the following to initialise the minikube cluster
			`./ksbctl init`
* To have the sandbox apply a licence, create a user and set its password create a file called `~/.tyk-sandbox` and populate it with 

```
	SBX_LICENSE=<your tyk-pro licence>
	SBX_USER=you.email@address.com
	SBX_PASSWORD=<base64 encoded password>
	SBX_MDCB_LICENSE=<your MDCB licence>
```
* Deploying with MDCB requires the MDCB license to be in `~/.tyk-sandbox` as above, but ordinary use does not.
* Deploy a basic config with `./ksbctl create -v 5.0.12 -t "This is my test deployment"`
* If running on Linux then when the command completes you will be able to access components using the URLs provided
* Other platforms may need to use minikube magic to make the services available

### Quick start guide

      [USAGE]: ksbctl create -v <tyk version> -t <namespace description> -N <namespace name> [-p|-s] [-c gateway_count] [-e edge_gw_count] [-m] [-o] [-i]
          Create a tyk instance in a namespace sandbox with the version given as a tag with -v
          -c The number of control plane gateway replicas to run
          -d Don't publish any sample APIs
          -D The size of the allocated Mongo or PG storage in GiB (default: 5)
          -e The number of edge gateway replicas to run
          -E A file to read environment variables from and add them all deployments
          -H Setup hybrid install. Provide the control plane k-sandbox here
          -h Setup the edge gateways to use https (implies -m and incompatible with -i)
          -i Add the istio label to the namespace so istio is injected into the pods
          -l set the log level of the containers (debug, info, warning or error)
          -m Run MDCB and configure edge gateways
          -N Use the given namespace name rather than the next available sandbox
             Useful when there's a need to import apis and policy YAML with set namespace
          -n Don't use '/home/pstubbs/.tyk-sandbox' to bootstrap the install
          -o Create OperatorContext for Tyk Operator
          -p Deploy with postgres not mongo
          -s Deploy a stand alone gateway
          -S Enable the MDCB synchroniser
          -R The size of the allocated redis control or data plane storage in GiB (default: 1)
          -t Description of the sandbox namespace
          -v Version tag. The file /home/pstubbs/code/k8s-sandbox/tyk-versions.list contains the versions used
    ksbctl delete <sandbox namespace...>
          Delete the sandbox namespace given as a tag and all resources in it
    ksbctl get <sandbox namespace...> [description|dashboard|control-gw|control-redis|edge-gw|edge-redis|key|mdcb|mongo|postgres|orgid]
          print the requested detail in a way that's useful in another script
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
             so make sure it's right
    ksbctl monitor <sandbox namespace> <pod name>
          Print CPU and memory usage for the containers in the pod every 5 seconds
    ksbctl operatorlogs
          Tail the logs of the tyk operator pod
    ksbctl pods <sandbox namespace...>
          List pods in namespace
    ksbctl publish <sandbox namespace> <api.json ...>
          Publish the API in api.json into the sandbox
    ksbctl setup <operator|istio>
          operator: install the latest version of operator ready for contexts in sandbox namespaces
          istio: setup istio so that it's possible to monitor and configure the sandbox networks
    ksbctl shell <sandbox namespace> <podname>
          Start an interactive shell in the pod.
          The pod name can be a substring of the actual name
          eg. ksbctl shell ksandbox-1 dashboard
    ksbctl start
          Start the minikube cluster if it's not running
    ksbctl versions
          Show the image version of each pod in each deployment

    Environment variable meanings:
          KSBCTL_CLUSTER: use the named cluster rather than the default 'minikube'
                          This can also be specified by 'ksbctl -C CLUSTERNAME create' etc.
          KSBX_OPERATOR_VERSION: use the named Tyk operator release when setting up operator using
                          ksbctl setup operator

