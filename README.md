# k8s-sandbox, Scripts to bring tyk up in minikube

## Quickly create a namespace that runs a specific version of tyk.

* Should be really simple to get started on Linux and MacOS. 
* Checkout this repo.

### Quick start guide

      ./ksbctl
      [USAGE]:
      ksbctl create -v <tyk version> -t <namespace description> [-p|-s] [-c gateway_count]
          Create a tyk instance the name space given as a tag with -v
          -e the number of edge gateway replicas to run
          -c the number of gateway replicas to run
          -m run MDCB and configure edge gateways
          -p deploy with postgres not mongo
          -s deploy a stand alone gateway
          -t description of the namespace
      ksbctl delete <namespace>
          Delete the namespace given as a tag and all resources in it
      ksbctl list
          List all namespaces
      ksbctl logs <namespace> <podname>
          Tail the logs of the named pod
      ksbctl info <namespace>
          Print info on the particular instance
      ksbctl shell <namespace> <pod>
        Start an interactive shell in the pod.
        The pod name can be a substring of the actual name
        eg. ksbctl shell ns1 dashboard
