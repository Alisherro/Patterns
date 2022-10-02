abstract class Observer {
  void handleEvent(List<String> items);
}

abstract class Observed {
  void addObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}

class Subscriber implements Observer {
  void handleEvent(List<String> items) {
    print(items);
  }
}

class ShoppingCart implements Observed {
  late List<String> items = [];
  late List<Observer> subscribers = [];

  void addItem(String item) {
    this.items.add(item);
    notifyObservers();
  }

  void removeItem(String item) {
    this.items.remove(item);
    notifyObservers();
  }

  @override
  void addObserver(Observer observer) {
    this.subscribers.add(observer);
  }

  @override
  void notifyObservers() {
    for (Observer observer in subscribers) {
      observer.handleEvent(this.items);
    }
  }

  @override
  void removeObserver(Observer observer) {
    this.subscribers.remove(observer);
  }
}

void main() {
  var shoppingCart = ShoppingCart();
  var firstSubscriber = Subscriber();
  shoppingCart.addItem('Bread');
  shoppingCart.addObserver(firstSubscriber);
  shoppingCart.addItem('Milk');
  shoppingCart.addItem('Chocolate');
  shoppingCart.removeItem('Bread');
}
