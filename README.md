# Example projet template
#https://realpython.com/django-nginx-gunicorn/

This example project only supports the latest version of Django.

## Instructions
```bash
sudo apt update
sudo apt install -y python3-pip python3-dev nginx
sudo apt install python3.12-venv
mkdir ~/project
cd ~/project
git clone https://github.com/saslamjaved/web.git
cd web/
python3 -m venv ~/project/venv
source ~/project/venv/bin/activate
sh upd.sh
pip install -r requirements.txt
echo "export SECRET_KEY='$(openssl rand -hex 40)'" > .DJANGO_SECRET_KEY
source .DJANGO_SECRET_KEY
python manage.py migrate
python -m pip install gunicorn
sudo mkdir -pv /var/{log,run}/gunicorn/
sudo chown -cR ubuntu:ubuntu /var/{log,run}/gunicorn/
sudo rm -f /etc/nginx/sites-available/default
sudo rm -f /etc/nginx/sites-enabled/default
sudo cp files/ikSite /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/ikSite /etc/nginx/sites-enabled/
sudo mkdir -pv /var/www/iksaan.com/static/
sudo chown -cR ubuntu:ubuntu /var/www/iksaan.com/
python manage.py collectstatic
gunicorn -c config/gunicorn/dev.py
sudo systemctl restart nginx
```
