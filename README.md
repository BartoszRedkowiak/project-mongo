# MonGo
Mongo is a web application catering to longboarders and skateboarders, allowing for marking locations in Warsaw based on 
place designation.

Contrary to popular belief, name of the app derived not from MongoDB, but from specific style of riding (associated with 
beginner skateboarders) and Pokemon Go app which was the main source of inspiration for this project :)

## Features
- placing and persisting locations on the map,
- filtering locations by category and distance (from center of the Warsaw),
- commenting and rating location,
- toggling event on location, allowing users to embedd instagram videos and vote for best trick performed there,
- basic administrative functions

## Technologies used in  the project
- Spring Boot 2
- Spring Security
- Spring Data
- Google Maps API
- Hibernate
- Javascript/jQuery
- JSP templates
- MySQL database

## Setup
1. Create local mySQL schema (UTF-8 charset).
2. Pack the project using terminal command `mvn clean package`
3. Execute the application by passing database settings in the following command line:
```
java -jar project-mongo-0.0.1-SNAPSHOT.war 
--spring.datasource.url=<schema-URL>, 
--spring.datasource.username=<database-username>,  
--spring.datasource.password=<database-password>
```
Example:
```
java -jar charity-0.0.1-SNAPSHOT.war 
--spring.datasource.url=jdbc:mysql://localhost:3306/charity_donation?serverTimezone=UTC, 
--spring.datasource.username=root, 
--spring.datasource.password=confidentialpassword
```

Note: Application will populate database with crucial entries and create one user with admin privileges using queries located in import.sql dump file.
  
Admin credentials:  
login: admin@admin.pl  
password: Admin!123