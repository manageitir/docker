# Add manageit.ir docker mirror
cat > /etc/docker/daemon.json <<EOF
{
  "insecure-registries" : ["https://docker.manageit.ir"],
  "registry-mirrors": ["https://docker.manageit.ir"]
}
EOF

docker logout
sudo systemctl restart docker