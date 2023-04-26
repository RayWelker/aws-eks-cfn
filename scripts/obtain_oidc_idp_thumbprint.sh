mkdir certs | openssl s_client -servername oidc.eks.us-east-1.amazonaws.com -showcerts -connect oidc.eks.us-east-1.amazonaws.com:443 | \
awk '/-----BEGIN/,/-----END/{ if(/-----BEGIN/){f=sprintf("certs/certificate%d.crt",++i)};print > f}' && \
for file in certs/*; do openssl x509 -in $file -fingerprint -noout | awk '{print $2}' | tr -d ':'; done