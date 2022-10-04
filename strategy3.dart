abstract class Press {
  void press(int price);
}

class Bench implements Press {
  late String name;

  Bench(this.name);
  void press(int weights) {
    print('${name} Bench pressed ${weights + 20} kg');
  }
}

class SeatedLeg implements Press {
  late String name;

  SeatedLeg(this.name);
  void press(int weights) {
    print('${name} seat leg pressed ${weights + 20} kg');
  }
}

class WeightPlate {
  late int weight;

  WeightPlate(this.weight);

  int get getWeight => weight;
}

class Barbell {
  late List<WeightPlate> plates = [];
  void addWeight(WeightPlate plate) {
    plates.add(plate);
  }

  int calculateTotal() {
    int sum = 0;
    for (WeightPlate plate in plates) {
      sum += plate.getWeight;
    }
    return sum;
  }

  void press(Press press) {
    int weight = calculateTotal();
    press.press(weight);
  }
}

void main() {
  var barbell = Barbell();
  var plate1 = WeightPlate(20);
  var plate2 = WeightPlate(30);
  barbell.addWeight(plate1);
  barbell.addWeight(plate2);

  barbell.press(Bench('Alisher'));
  barbell.press(SeatedLeg('Alisher'));
}
