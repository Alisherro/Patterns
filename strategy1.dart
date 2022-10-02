abstract class Subject {
  String announce();
}

class Algebra implements Subject {
  String announce() => "solving complex algebra problems ";
}

class Biology implements Subject {
  String announce() => "studying different forms of life ";
}

class Drawing implements Subject {
  String announce() => "drawing beautiful mountain views";
}

class Student {
  Subject preferredSubject;
  String name;
  Student(this.name, this.preferredSubject);
}

void main() {
  var AlgebraStudent = Algebra();
  var BiologyStudent = Biology();
  var DrawingStudent = Drawing();

  var alisher = Student("Alisher", AlgebraStudent);
  var bahyt = Student("Bahyt", BiologyStudent);
  var daulet = Student("Daulet", DrawingStudent);

  for (var person in [alisher, bahyt, daulet]) {
    print("Hey ${person.name}, what do you love to do?");
    print("I'm enjoying ${person.preferredSubject.announce()}!\r\n");
    
  }
}
