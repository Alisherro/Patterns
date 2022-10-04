abstract class Observer {
  void notification(String handle, String news);
}

abstract class Observed {
  void addSubscriber(Observer observer);
  void removeSubscriber(Observer observer);
  void notifySubscribers(String email);
}

class Store implements Observed {
  late List<Observer> observers = [];
  late String name;
  late String news;
  Store(String name) {
    this.name = name;
    this.news = " - FROM : " + name;
  }
  String getName() {
    return name;
  }

  void sendNews(String news) {
    print("\nName: ${name}, News : ${news}\n");
    notifySubscribers(news);
  }

  void addSubscriber(Observer observer) {
    observers.add(observer);
  }

  void removeSubscriber(Observer observer) {
    observers.remove(observer);
  }

  void notifySubscribers(String n) {
    for (Observer a in observers) {
      a.notification(news, n);
    }
  }
}

class Subscriber implements Observer {
  late String name;
  Subscriber(String name) {
    this.name = name;
  }

  void notification(String handle, String a) {
    print("${name} received news: ${handle} - NEWS: '${a}'\n");
  }
}

void main() {
  Store n1 = new Store("Shop.kz");
  Subscriber s1 = new Subscriber("Alisher");
  Subscriber s2 = new Subscriber("Bolat");
  n1.addSubscriber(s1);
  n1.addSubscriber(s2);
  n1.sendNews("Summer sales!");
  n1.removeSubscriber(s2);
  n1.sendNews("Only in August");
}
