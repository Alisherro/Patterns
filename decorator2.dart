abstract class Car {
  void assemble();
}

class BasicCar implements Car {
  void assemble() {
    print('Basic Car');
  }
}

class CarDecorator implements Car {
  late Car car;

  CarDecorator(this.car);
  void assemble() {
    this.car.assemble();
  }
}

class SportsCar extends CarDecorator {
  SportsCar(Car car) : super(car);

  void assemble() {
    super.assemble();
    print(" Adding features of Sports Car.");
  }
}

class LuxuryCar extends CarDecorator {
  LuxuryCar(Car car) : super(car);

  create(Car c) {
    CarDecorator(c);
  }

  void assemble() {
    super.assemble();
    print(" Adding features of Luxury Car.");
  }
}

void main() {
  var car = new BasicCar();
  Car sportsCar = new SportsCar(car);
  sportsCar.assemble();
  print("\n*****");

  Car sportsLuxuryCar = new SportsCar(new LuxuryCar(car));
  sportsLuxuryCar.assemble();
}
