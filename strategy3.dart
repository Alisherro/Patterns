abstract class Payment {
  void pay(int price);
}

class CreditCard implements Payment {
  late String name;
  late String cardNumber;

  CreditCard(this.name, this.cardNumber);
  void pay(int price) {
    print('${price} paid with Credit Card');
  }
}

class Phone implements Payment {
  late String emailid;
  late String password;

  Phone(this.emailid, this.password);
  void pay(int price) {
    print('${price} paid using Phone');
  }
}

class Item {
  late String name;
  late int price;

  Item(this.name, this.price);

  int get getPrice => price;
  String get getName => name;
}

class ShoppingCart {
  late List<Item> items = [];
  void addItem(Item item) {
    items.add(item);
  }

  int calculateTotal() {
    int sum = 0;
    for (Item item in items) {
      sum += item.getPrice;
    }
    return sum;
  }

  void pay(Payment payment) {
    int price = calculateTotal();
    payment.pay(price);
  }
}

void main() {
  var cart = ShoppingCart();
  var item1 = Item('Bread', 140);
  var item2 = Item('Milk', 280);
  var item3 = Item('Milk', 280);
  cart.addItem(item1);
  cart.addItem(item2);
  cart.addItem(item3);
  cart.pay(Phone('good071104@gmail.com', 'password'));
}
