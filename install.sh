nohup bash -c '
set -e
export DEBIAN_FRONTEND=noninteractive

# force IPv4 (anti timeout)
echo "Acquire::ForceIPv4 \"true\";" > /etc/apt/apt.conf.d/99force-ipv4

# update
apt update -y

# base deps
apt install -y ca-certificates curl gnupg lsb-release

# docker
apt install -y docker.io docker-compose

# enable docker
systemctl enable docker
systemctl start docker
' > /root/docker-install.log 2>&1 &
