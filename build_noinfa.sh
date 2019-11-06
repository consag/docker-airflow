docker build -t jactools/docker-airflow-informatica:noinfa .
docker tag jactools/docker-airflow-informatica:noinfa jactools/docker-airflow-informatica:noinfa-latest
docker tag jactools/docker-airflow-informatica:noinfa-latest jactools/docker-airflow-informatica:latest

