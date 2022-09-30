abstract class Subject {
  String announce(String place);
}

class Algebra implements Subject {
  String announce(String place) => "solving complex algebra problems ${place}";
}

class Biology implements Subject {
  String announce(String place) =>
      "I like to studying different forms of life ${place}";
}

class Drawing implements Subject {
  String announce(String place) => "drawing beautiful mountain views ${place}";
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

  var me = Student("Alisher", AlgebraStudent);
  var europeanBuddy = Student("Pieter", BiologyStudent);
  var myDaughter = Student("Joanie", DrawingStudent);

  final String roastOfTheDay = "at school";

  for (var person in [me, europeanBuddy, myDaughter]) {
    print("Hey ${person.name}, whats ur favorite subject?");
    print(
        "I'm enjoying ${person.preferredSubject.announce(roastOfTheDay)}!\r\n");
  }
}
