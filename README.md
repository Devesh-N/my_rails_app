# README

* System dependencies
  * Ruby version: 2.7.0


* Database creation
    Edit files:
    * app/controllers/messages_controller.rb and add redis IP in Line five
    * config/database.yml add PostgreSQL IP in line 4 and line 28

* Database initialization for PostgreSQL
    * Add db `test`
    * Create table `numbers` with column `number` with datatype integer in `test` db


* Services:
  * If you want to use EKS there is logstash configuration in `/logstash logging files` and logs in /log.
  * There is EKS docker compose file too. 

* Deployment instructions
  * If you want to use it easily use Docker: `docker run -it -p 3000:3000 imgid`

* ...
