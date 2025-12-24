# 1. Удалите конкретный контейнер
docker rm -f joomla-mysql

# 2. Удалите все контейнеры с joomla в имени
docker rm -f $(docker ps -aq --filter "name=joomla")

# 3. Перейдите в папку проекта
cd ~/joomla-project

# 4. Запустите
docker-compose up -d