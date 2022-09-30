abstract class Fighter {
  KickBehavior kickBehavior;
  JumpBehavior jumpBehavior;

  Fighter(this.kickBehavior, this.jumpBehavior);

  setKickStrategy(KickBehavior kickBehavior) {
    this.kickBehavior = kickBehavior;
  }

  setJumpStrategy(JumpBehavior jumpBehavior) {
    this.jumpBehavior = jumpBehavior;
  }

  void kick() {
    kickBehavior.kick();
  }

  void jump() {
    jumpBehavior.jump();
  }

  void display();

  void punch() {
    print('Punch!');
  }
}

abstract class KickBehavior {
  void kick();
}

class LightningKick implements KickBehavior {
  @override
  void kick() {
    print('This is a Lightning Kick');
  }
}

class TornadoKick implements KickBehavior {
  @override
  void kick() {
    print('This is a Tornado Kick');
  }
}

abstract class JumpBehavior {
  void jump();
}

class LongJump implements JumpBehavior {
  @override
  void jump() {
    print('This is a Long Jump');
  }
}

class ShortJump implements JumpBehavior {
  @override
  void jump() {
    print('This is a Short Jump');
  }
}

class Paul extends Fighter {
  Paul(KickBehavior kickBehavior, JumpBehavior jumpBehavior)
      : super(kickBehavior, jumpBehavior);
  @override
  void display() {
    print('Hi, I am Paul!');
  }

  @override
  void roll() {}
}

main() {
  JumpBehavior shortJump = ShortJump();
  JumpBehavior longJump = LongJump();
  KickBehavior tornadoKick = TornadoKick();
  KickBehavior lightningKick = LightningKick();

  Fighter paul = Paul(tornadoKick, shortJump);
  paul.display();
  paul.punch();
  paul.kick();
  paul.jump();

  paul.setJumpStrategy(longJump);
  paul.setKickStrategy(lightningKick);
}
