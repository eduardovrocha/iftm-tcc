import {Controller} from "stimulus"

export default class extends Controller {

    connect() {
        console.log('Stimulus JS loaded ShopController');
        this.updateCart();
    }

    initialize() {
    }

    // VIEW RENDER METHODS
    updateCart() {
        $('#cartItems')[0].innerText = JSON.parse(localStorage.cart).items.length
    }

}