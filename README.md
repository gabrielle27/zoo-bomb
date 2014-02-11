# ZooBomb

Rails application for keeping a catalog of zoos.

* Every zoo has a name and a list of animals.
* Every animal has a name and a species and belongs to a single zoo.
* A user can perform standard CRUD operations (create, read, update, delete) for zoos and animals.
* For each zoo, the user can see a list of its animals.
* The user can see a list of all zoos with the number of unique species present in each zoo. (For example: If the Clackamas County Zoo has a monkey named Alice, a monkey named Bob, and an elephant named Zeus, then its number of species is 2.)

## Requirements

* Rails 4
* Ruby 2.0


## External Services

* PostgreSQL 9.3.2


## Sandbox Hosting

1. bundle install
2. rake db:create
3. rake db:migrate
