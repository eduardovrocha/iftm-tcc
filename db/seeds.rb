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
    {name: 'Lord of The Rings', price: 90.5, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", img_url: "", category_id: 2},
    {name: 'Notebook', price: 890.0, description: "Nulla eu imperdiet purus. Maecenas sem ante, molestie ut co.", img_url: "", category_id: 3},
    {name: 'Macbook Pro', price: 1250.0, description: "Nam eleifend maximus tortor, at mollis arcu cursus sit amet. ", img_url: "", category_id: 3 },
    {name: 'PC Gamer', price: 1200.0, description: "Donec aliquet odio ac rhoncus cursus. Aliquam orci ante.", img_url: "", category_id: 3 },
    {name: 'Rails for Dummies', price: 100.99, description: "Cras fringilla convallis sem vel faucibus. Nulla eu imperdiet purus. Maecenas sem ante.", img_url: "", category_id: 2}
])

User.create!([
    {name: 'Eduardo', email: 'evr.online.lessons@gmail.com', phone: '34 9 9113-9183', password: '123456'},
    {name: 'Nelio', email: 'nelio.cursos@gmail.com', phone: '34 9 9000-0009', password: '123456'}
])

Role.create!([
    {ability: 'admin', user_id: 1},
    {ability: 'admin', user_id: 2}
             ])

Order.create!([
    {moment: Date.new(2019, 2, 13), order_status: OrderStatus.statuses[:waiting_payment], user_id: 1},
    {moment: Date.new(2019, 2, 12), order_status: OrderStatus.statuses[:paid], user_id: 1},
    {moment: Date.new(2019, 4, 11), order_status: OrderStatus.statuses[:waiting_payment], user_id: 1},
    {moment: Date.new(2019, 4, 13), order_status: OrderStatus.statuses[:waiting_payment], user_id: 1},
    {moment: Date.new(2019, 6, 12), order_status: OrderStatus.statuses[:paid], user_id: 2},
    {moment: Date.new(2019, 6, 11), order_status: OrderStatus.statuses[:waiting_payment], user_id: 2}
])

OrderItem.create!([
    {quantity: 2, price: 90.5, product_id: 1, order_id: 1},
    {quantity: 1, price: 1200.0, product_id: 4, order_id: 1},
    {quantity: 1, price: 1200.0, product_id: 4, order_id: 2},
    {quantity: 1, price: 890.0, product_id: 2, order_id: 3},
    {quantity: 2, price: 1250.0, product_id: 3, order_id: 3},
    {quantity: 1, price: 100.99, product_id: 5, order_id: 4},
    {quantity: 2, price: 1200.0, product_id: 4, order_id: 5},
    {quantity: 1, price: 1250.0, product_id: 3, order_id: 5},
    {quantity: 1, price: 1200.0, product_id: 4, order_id: 6}
])