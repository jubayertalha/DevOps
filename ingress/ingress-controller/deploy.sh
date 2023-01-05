helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx \
  --set controller.extraArgs.default-ssl-certificate="default/selfca-ingress-tls" \
  -f internal-ingress.yaml