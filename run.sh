terraform apply -auto-approve
aws eks --region us-west-2 update-kubeconfig --name aerospike_demo
kubectl get svc
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/ecr/?ref=master"
# kubectl apply -f cluster-autoscaler.yaml
kubectl get pod -n kube-system
