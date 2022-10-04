abstract class Payment {
  void pay(int amount);
}

class CreditCard implements Payment {
  late String name;
  late String cardNumber;
  late String cvv;
  late String dateOfExpiry;
  CreditCard(this.name, this.cardNumber, this.cvv, this.dateOfExpiry);
  void pay(int amount) {
    print('${amount} paid with CReadit Card');
  }
}

class Phone implements Payment {
  late String emailid;
  late String password;

  Phone(this.emailid, this.password);
  void pay(int amount) {
    print('${amount} paid using Phone');
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
    int amount = calculateTotal();
    payment.pay(amount);
  }
}

void main() {
  var cart = ShoppingCart();
  var item1 = Item('Bread', 140);
  var item2 = Item('Milk', 280);
  cart.addItem(item1);
  cart.addItem(item2);
  cart.pay(Phone('good071104@gmail.com', 'password'));
}

