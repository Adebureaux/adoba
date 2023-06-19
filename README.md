# System dependencies

ruby 3.2.2

rails 7.0.5

nodejs 18.16.0

npm 9.7.1

quasar client 2.0.0

bundler 2.4.14

gem 3.4.14

# How to run this project

  * ```git clone https://github.com/Adebureaux/adoba.git```
  * ```cd adoba```
  * Split in two terminals
  * In the first one
  * ```cd backend```
  * ```bundle install --gemfile Gemfile```
  * ```rails db:migrate```
  * ```rails db:seed```
  * ```rails server```
  * In the other terminal
  * ```cd frontend```
  * ```npm i```
  * ```quasar dev``` or ```npx quasar dev```

Access the web app at this address : http://localhost:9000
Access the api base url : http://localhost:3000

# API Routes

The api routes are defined as follow:
## Indicators
* ```GET /indicators```
Returns the string array of indicators.

* ```PATCH /indicators```
Update the string array of indicators.
Params: indicator as string

* ```DELETE /indicators```
Takes a string :indicator and removes it from the array of indicators.
Params: indicator as string

## Collections
Collection object is defined as follow:
- id: number
- name: string
- date: date
- association_name: string
- dynamic_attribute: { dynamic_attribute: {} }

* ```GET /collections```
Returns the array of collection object.

* ```GET /collections/count```
Returns the number of collections in the database.

* ```POST /collections```
Takes a Collection object and add it to the database.
Params: Collection object

* ```PATCH /collections``` (Implemented but not used yet)
Takes a Collection object and add it to the database.
Params: Collection object

* ```DELETE /collections``` (Implemented but not used yet)
Takes a Collection id and delete it from the database.
Params: id as number
