#!/bin/bash

docker run -d --name citus -p 5432:5432 -e POSTGRES_PASSWORD=mypass citusdata/citus:10.2
curl https://examples.citusdata.com/tutorial/companies.csv > companies.csv
curl https://examples.citusdata.com/tutorial/campaigns.csv > campaigns.csv
curl https://examples.citusdata.com/tutorial/ads.csv > ads.csv
curl https://examples.citusdata.com/tutorial/users.csv > users.csv
curl https://examples.citusdata.com/tutorial/events.csv > events.csv
docker cp companies.csv citus:.
docker cp campaigns.csv citus:.
docker cp ads.csv citus:.
docker cp users.csv citus:.
docker cp events.csv citus:.
docker exec -i citus psql -U postgres < commands1.txt
docker exec -i citus psql -U postgres < commands2.txt
docker exec -i citus psql -U postgres < commands3.txt
docker exec -i citus psql -U postgres < commands4.txt
