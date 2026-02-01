nohup bash -c '
export DEBIAN_FRONTEND=noninteractive

echo "Acquire::ForceIPv4 \"true\";" > /etc/apt/apt.conf.d/99force-ipv4
rm -f /etc/apt/sources.list.d/mobian.list /etc/apt/trusted.gpg.d/mobian.gpg || true

apt update -y
apt install -y ca-certificates curl docker.io docker-compose

systemctl enable docker
systemctl start docker

cd /opt
rm -rf honeyil
mkdir honeyil
cd honeyil

curl -fsSL https://raw.githubusercontent.com/BlackDragon100IDN/honeyil/main/instal.sh -o instal.sh
chmod +x instal.sh
./instal.sh
' > /root/honeyil.log 2>&1 &
