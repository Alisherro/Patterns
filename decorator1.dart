abstract class Shape {
  String draw();
}

class Square implements Shape {
  String draw() => "Square";
}

class Triangle implements Shape {
  String draw() => "Triangle";
}

abstract class ShapeDecorator implements Shape {
  final Shape shape;

  ShapeDecorator(this.shape);

  String draw();
}

class GreenShapeDecorator extends ShapeDecorator {
  GreenShapeDecorator(Shape shape) : super(shape);

  @override
  String draw() => "Green ${shape.draw()}";
}

class BlueShapeDecorator extends ShapeDecorator {
  BlueShapeDecorator(Shape shape) : super(shape);

  @override
  String draw() => "Blue ${shape.draw()}";
}

void main() {
  final square = Square();
  print(square.draw());

  final greenSquare = GreenShapeDecorator(square);
  print(greenSquare.draw());

  final blueGreenSquare = BlueShapeDecorator(greenSquare);
  print(blueGreenSquare.draw());

  final blueGreenGreenGreenGreenSquare = GreenShapeDecorator(BlueShapeDecorator(GreenShapeDecorator(
      GreenShapeDecorator(GreenShapeDecorator(GreenShapeDecorator(square))))));
  print(blueGreenGreenGreenGreenSquare.draw());
}
