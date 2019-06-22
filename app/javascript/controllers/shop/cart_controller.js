import {Controller} from "stimulus"

export default class extends Controller {

    connect() {
        console.log('Stimulus JS loaded CartController');
        this.renderCart()
    }

    initialize() {
    }

    // VIEW RENDER METHODS

    renderCart() {
        const liModel = $('#cart-products > li.order-item').first();
        $('#cart-products > li.order-item').remove();
        this.asyncForEach(this.getCart().items, async (item, index) => {

            $(liModel).clone().prependTo('#cart-products');
            let itemLi = $('#cart-products > li.order-item').first()
            if (itemLi.length > 0) {
                /*
                    set view values
                */
                itemLi.find('.item-product-name')[0].innerText = item.name
                itemLi.find('.item-qtd')[0].innerText = item.quantity
                itemLi.find('.item-vlr-und')[0].innerText = item.price
                itemLi.find('.item-vlr-total')[0].innerText = this.formatDecimalValue(this.subTotal(item.price, item.quantity))
                /*
                    set data-product_id
                */
                itemLi.find('.add-qty')[0].setAttribute('data-product_id', item.product_id)
                itemLi.find('.rem-qty')[0].setAttribute('data-product_id', item.product_id)
                itemLi.find('.delete-item')[0].setAttribute('data-product_id', item.product_id)
            }

        }).then(() => {

            /*
                set items amount on cart
            */
            $('#your-cart-items')[0].innerText = this.getCart().items.length

            /*
                calculate order total
            */
            let _total = 0
            this.asyncForEach($('.item-vlr-total'), async (item, index) => {
                _total = _total + parseFloat(item.innerText)
            }).then(() => {
                if ($('#total-value').length > 0) {
                    $('#total-value')[0].innerText = this.formatDecimalValue(_total)
                }
            })

        })
    }

    /*
        format decimal value
    */
    subTotal(price, quantity) {
        let subTotal = price * quantity
        return this.formatDecimalValue(subTotal)
    }

    /*
        format decimal value
    */
    formatDecimalValue(num) {
        return parseFloat(num).toFixed(2)
    }

    /*
    async iterator for array element
    */
    async asyncForEach(array, callback) {
        for (let index = 0; index < array.length; index++) {
            await callback(array[index], index, array);
        }
    }

    // EVENT HANDLERS (RECEBE EVENTOS DO USUARIO, MUDA O MODEL E ATUALIZA A VIEW)

    onAddToCart(event) {
        let newItem = JSON.parse(event.path[0].getAttribute('data-item'));
        this.addToCart(newItem);
        this.renderCart();
    }

    onIncreaseQuantity(event) {
        let product_id = JSON.parse(event.path[1].getAttribute('data-product_id'));
        this.incrementItem(product_id);
        this.renderCart();
    }

    onDecreaseQuantity(event) {
        let product_id = JSON.parse(event.path[1].getAttribute('data-product_id'));
        this.decrementItem(product_id);
        this.renderCart();
    }

    onRemoveItem(event) {
        let product_id = JSON.parse(event.path[1].getAttribute('data-product_id'));
        this.removeItem(product_id);
        this.renderCart();
    }

    onClearCart(event) {
        this.clearCart();
        this.renderCart();
    }

    // CART SERVICE METHODS (NAO PODE MEXER NA TELA)

    addToCart(item) {
        let cart = this.getCart();
        let pos = this.findItem(item.product_id, cart);
        if (pos == -1) {
            cart.items.push(item);
            cart.date_time = Date.now();
            this.setCart(cart);
        }
    }

    getCart() {
        if (localStorage.hasOwnProperty('cart')) {
            return JSON.parse(localStorage.cart);
        } else {
            let cart = {items: [], date_time: Date.now()};
            localStorage.setItem("cart", JSON.stringify(cart));
            return cart;
        }
    }

    setCart(cart) {
        localStorage.setItem("cart", JSON.stringify(cart));
    }

    findItem(product_id, cart) {
        for (let i = 0; i < cart.items.length; i++) {
            if (cart.items[i].product_id == product_id) {
                return i;
            }
        }
        return -1;
    }

    incrementItem(product_id) {
        let cart = this.getCart();
        let pos = this.findItem(product_id, cart);
        if (pos != -1) {
            cart.items[pos].quantity++;
            this.setCart(cart);
        }
    }

    decrementItem(product_id) {
        let cart = this.getCart();
        let pos = this.findItem(product_id, cart);
        if (pos != -1) {
            if (cart.items[pos].quantity > 1) {
                cart.items[pos].quantity--;
            }
            this.setCart(cart);
        }
    }

    removeItem(product_id) {
        let cart = this.getCart();
        let pos = this.findItem(product_id, cart);
        if (pos != -1) {
            cart.items.splice(pos, 1);
            this.setCart(cart);
        }
    }

    clearCart() {
        this.setCart({items: [], date_time: Date.now()});
    }

}