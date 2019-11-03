envFile=$1
if [ -z "$envFile" ] ; then
   envFile=development.env
fi
if [ -f "$envFile" ] ; then
   docker run -d --name airflow -p 8080:8080 --env-file $envFile jactools/docker-airflow-informatica webserver
else
   docker run -d --name airflow -p 8080:8080 jactools/docker-airflow-informatica webserver
fi

