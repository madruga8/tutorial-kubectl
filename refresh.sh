docker build -t php-webapp:latest .

kubectl delete pods -l app=php-webapp
