# Basket challenge

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

curl http://localhost:3000/products
curl -X PATCH -H "Content-Type: application/json" -d '{"product":{"price": 17.50}}' http://localhost:3000/products/4
curl -X POST -H "Content-Type: application/json" -d '{"items": "2 MUG, 1 TSHIRT"}' http://localhost:3000/carts
