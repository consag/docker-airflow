envFile=%1
if "%envFile%" == "" set envFile=development.env

if exist %envFile% docker run -d --name airflow -p 8080:8080 --env-file %envFile% jactools/docker-airflow-informatica webserver
if not exist %envFile% docker run -d --name airflow -p 8080:8080 jactools/docker-airflow-informatica webserver


