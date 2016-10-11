This is a Dockefile to build https://github.com/airbnb/caravel.

# To get started
- run this command 
        docker -it run mwaaas/caravel-docker -p 80:80 
- check this url http://localhost

# Customization of how the container runs.

###### Environments used to customize  admin account creation
   
1. username  This creates caravel username if not defined it creates admin by default
              
2. password  Defines super user password if not defined it uses admin be default
                                                        
3. firstname First name of the admin account, default is admin

4. lastname  Last name of the admin account, default is admin

5. email     Email to use for admin account, default is admin@example.com 

###### Environments used for database creation

  Variable                      Required          Default                                       Description

1. SQLALCHEMY_DATABASE_URI      No                sqlite:////usr/src/app/caravel.db             Database for caravel to use


###### LOADING EXAMPLE DATA
    docker exec {container_id}  caravel load_examples
    
###### Creating admin account 
        fabmanager create-admin --app caravel 
        
###### Using docker compose version 2
        version: '2'
        services:
            db:
                image: postgres:9.5
                environment:
                    - POSTGRES_DB=caravel
                    - POSTGRES_PASSWORD=mysecretpassword
                    - POSTGRES_DB=caravel_db
                ports:
                    - 5435:5432
            app:
                image: mwaaas/caravel-docker:latest
                environment:
                    - SQLALCHEMY_DATABASE_URI=postgresql+psycopg2://postgres:mysecretpassword@db/caravel_db
                depends_on:
                    - db
                ports:
                    - 80:80
                links:
                    - db:db


Using version 1

        caravel:
          environment:
            - 'SQLALCHEMY_DATABASE_URI=postgresql+psycopg2://postgres:postgres@db/postgres'
          image: 'mwaaas/caravel-docker:latest'
          links:
            - 'caravel-db:db'
            - 'database.tumacredo-prod:tumacredo-db-prod'
          ports:
            - '8089:8088'
        caravel-db:
          image: 'postgres:9.5'
          ports:
            - '5435:5432'

