#!/bin/bash
NODENAME=$1
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: node-shell-${NODENAME}
  namespace: kube-system
spec:
  containers:
  - name: shell
    image: "docker.io/alpine:3.9"
    securityContext:
      privileged: true
    command: ["nsenter"]
    args: ["-t", "1", "-m", "-u", "-i", "-n", "sleep", "14000"]
  hostIPC: true
  hostNetwork: true
  hostPID: true
  terminationGracePeriodSeconds: 0
  restartPolicy: Never
  tolerations:
    - operator: Exists
  nodeName: ${NODENAME}
EOF

sleep 10

kubectl exec -it -n kube-system node-shell-${NODENAME} -- /bin/bash

#kubectl delete pod -n kube-system node-shell-${NODENAME}
