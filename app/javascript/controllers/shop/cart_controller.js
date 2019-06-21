import {Controller} from "stimulus"

export default class extends Controller {

    connect() {
        console.log('Stimulus JS loaded ProductsController');
        console.log(this.element);
    }

    initialize() {
    }

    addToCart(event) {
        let newItem = JSON.parse(event.path[0].getAttribute('data-item'));
        let item = this.findItem(newItem.product_id);
        if (item == null) {
            let items = this.getCart().items;
            items.push(newItem);
            localStorage.setItem("order", JSON.stringify({"items": items, "date_time": Date.now()}))
        }
    }

    getCart() {
        if (localStorage.hasOwnProperty('order')) {
            return JSON.parse(localStorage.order);
        } else {
            let order = {"items": [], "date_time": Date.now()};
            localStorage.setItem("order", JSON.stringify(order));
            return order;
        }
    }

    findItem(product_id) {
        let cart = this.getCart();
        for (let i=0; i<cart.items.length; i++) {
            if (cart.items[i].product_id == product_id) {
                return cart.items[i];
            }
        }
        return null;
    }
}