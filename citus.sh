#!/bin/bash

docker run -d --name citus -p 5432:5432 -e POSTGRES_PASSWORD=mypass citusdata/citus:10.2
curl https://examples.citusdata.com/tutorial/companies.csv > companies.csv
curl https://examples.citusdata.com/tutorial/campaigns.csv > campaigns.csv
curl https://examples.citusdata.com/tutorial/ads.csv > ads.csv
docker cp companies.csv citus:.
docker cp campaigns.csv citus:.
docker cp ads.csv citus:.
docker exec -i citus psql -U postgres < commands.txt
