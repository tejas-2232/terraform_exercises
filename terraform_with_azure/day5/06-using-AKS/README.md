* Execute below commands after executing `terraform apply`

* `kubectl get nodes --kubeconfig=kubeconfig`

```
NAME                              STATUS   ROLES   AGE     VERSION
aks-default-85437782-vmss000000   Ready    agent   8m35s   v1.21.9
aks-default-85437782-vmss000001   Ready    agent   8m37s   v1.21.9
```

* kubectl get pods --all-namespaces  --kubeconfig=kubeconfig

```
NAMESPACE     NAME                                  READY   STATUS    RESTARTS   AGE
kube-system   azure-ip-masq-agent-85bvh             1/1     Running   0          8m40s
kube-system   azure-ip-masq-agent-fgx9v             1/1     Running   0          8m38s
kube-system   coredns-845757d86-dn7qv               1/1     Running   0          8m23s
kube-system   coredns-845757d86-ngjff               1/1     Running   0          10m
kube-system   coredns-autoscaler-5f85dc856b-6brfd   1/1     Running   0          10m
kube-system   csi-azuredisk-node-cc4qd              3/3     Running   0          8m38s
kube-system   csi-azuredisk-node-ljpc4              3/3     Running   0          8m40s
kube-system   csi-azurefile-node-dlkss              3/3     Running   0          8m40s
kube-system   csi-azurefile-node-zd6vq              3/3     Running   0          8m38s
kube-system   kube-proxy-p8zkk                      1/1     Running   0          8m38s
kube-system   kube-proxy-v6vk2                      1/1     Running   0          8m40s
kube-system   metrics-server-774f99dbf4-hvmxk       1/1     Running   0          10m
kube-system   tunnelfront-bd55cb8cb-46rrs           1/1     Running   0          10m
```


