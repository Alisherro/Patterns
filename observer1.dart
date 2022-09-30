class Notification {
  late String message;
  late DateTime timestamp;
  Notification(this.message, this.timestamp);
  Notification.forNow(this.message) {
    timestamp = new DateTime.now();
  }
}

class Observable {
  late List<Observer> _observers;

  Observable([List<Observer>? observers]) {
    _observers = observers ?? [];
  }

  void registerObserver(Observer observer) {
    _observers.add(observer);
  }

  void notify_observers(Notification notification) {
    for (var observer in _observers) {
      observer.notify(notification);
    }
  }
}

class Observer {
  late String name;

  Observer(this.name);

  void notify(Notification notification) {
    print(
        "[${notification.timestamp.toIso8601String()}] Hey $name, ${notification.message}!");
  }
}

class CoffeeMaker extends Observable {
  CoffeeMaker([List<Observer>? observers]) : super(observers);
  void brew() {
    print("Brewing the coffee...");
    notify_observers(Notification.forNow("coffee's done"));
  }
}

void main() {
  var alisher = Observer("Alisher");
  var bolat = Observer("Bolat");
  var coffeeMaker = CoffeeMaker(List.from([alisher]));
  coffeeMaker.registerObserver(bolat);
  coffeeMaker.brew();
}
