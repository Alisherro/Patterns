abstract class Gun {
  String characteristics();
}

class Ak74 implements Gun {
  String characteristics() => "Ak74";
}

class M4A4 implements Gun {
  String characteristics() => "M4A4";
}

abstract class GunDecorator implements Gun {
  final Gun gun;

  GunDecorator(this.gun);

  String characteristics();
}

class MufflerGunDecorator extends GunDecorator {
  MufflerGunDecorator(Gun gun) : super(gun);

  @override
  String characteristics() => "${gun.characteristics()} with silencer";
}

class SightGunDecorator extends GunDecorator {
  SightGunDecorator(Gun gun) : super(gun);

  @override
  String characteristics() => "${gun.characteristics()} with optical sight";
}

void main() {
  final m4a4 = M4A4();
  print(m4a4.characteristics());

  final silenceGun = MufflerGunDecorator(m4a4);
  print(silenceGun.characteristics());

  final sightGun = SightGunDecorator(silenceGun);
  print(sightGun.characteristics());
}
