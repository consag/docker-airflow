echo "Copying Informatica 10.2.2 client tools..."
cp -pr ../software/informatica software/
echo "Docker build..."
docker build -t jactools/docker-airflow-informatica:infa1022 .
docker tag jactools/docker-airflow-informatica:infa1022 jactools/docker-airflow-informatica:infa1022-latest
rm -rf software/informatica

