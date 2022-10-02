abstract class Observer {
  void handleEvent(List<String> vacancies);
}

abstract class Observed {
  void addObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}

class Subscriber implements Observer {
  late String name;
  Subscriber(this.name);
  void handleEvent(List<String> vacancies) {
    print('Dear ${name}, we have some changes in vacancies:\n ${vacancies}');
  }
}

class DevelopeJobSite implements Observed {
  late List<String> vacancies;
  late List<Observer> subscribers;

  void addVacancy(String vacancy) {
    this.vacancies.add(vacancy);
    notifyObservers();
  }

  void removeVacancy(String vacancy) {
    this.vacancies.remove(vacancy);
    notifyObservers();
  }

  @override
  void addObserver(Observer observer) {
    this.subscribers.add(observer);
  }

  @override
  void notifyObservers() {
    for (Observer observer in subscribers) {
      observer.handleEvent(this.vacancies);
    }
  }

  @override
  void removeObserver(Observer observer) {
    this.subscribers.remove(observer);
  }
}

void main() {
  var jobSite = DevelopeJobSite();
  jobSite.addVacancy('First Java Position');
  jobSite.addVacancy('Second Java Position');

  var firstSubscriber = Subscriber('Eugene Suleimanov');
  var secondSubscriber = Subscriber('Petr Romanenko');

  jobSite.addObserver(firstSubscriber);
  jobSite.addObserver(secondSubscriber);

  jobSite.addVacancy('Third Java Position');
}
