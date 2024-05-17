terraform apply -auto-apply
aws eks --region us-west-2 update-kubeconfig --name aerospike_demo
kubectl get svc
kubectl apply -f cluster-autoscaler.yaml
kubectl get pod -n kube-system
