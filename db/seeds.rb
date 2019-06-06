# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!([
    {name: 'Electronics'},
    {name: 'Books'},
    {name: 'Computers'}
])

Product.create!([
    {name: 'Lord of The Rings', price: 90.5},
    {name: 'Notebook', price: 890.0 },
    {name: 'Macbook Pro', price: 1250.0 },
    {name: 'PC Gamer', price: 1200.0 },
    {name: 'Rails for Dummies', price: 100.99}
])