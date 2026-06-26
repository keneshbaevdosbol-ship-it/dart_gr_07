import 'game_character.dart';
import 'super_ability.dart';
import 'boss.dart';
import 'rpg_game.dart';
 
abstract class Hero extends GameCharacter {
  SuperAbility ability;
  Hero(super.name, super.health, super.damage, this.ability);
 
  void attack(Boss boss) {
    boss.health -= damage;
  }
 
  void applySuperPower(Boss boss, List<Hero> heroes);
}
 
 
class Warrior extends Hero {
  Warrior(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.criticalDamage);
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = damage * (RpgGame.random.nextInt(5) + 2); // 2..6
    boss.health -= crit;
    print('Warrior $name hits critically for $crit!');
  }
}
 
class Magic extends Hero {
  Magic(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.boost);
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.roundNumber <= 4) {
      int boost = RpgGame.random.nextInt(6) + 5; // 5..10
      for (var hero in heroes) {
        if (hero.isAlive() && hero != this) {
          hero.damage += boost;
        }
      }
      print('Magic $name boosted all allies by $boost damage!');
    }
  }
}
 
class Berserk extends Hero {
  int blockedDamage = 0;
  Berserk(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.blockAndRevert);
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name reverted $blockedDamage damage back to boss!');
  }
}
 
class Medic extends Hero {
  int healPoints;
  Medic(String name, int health, int damage, this.healPoints)
      : super(name, health, damage, SuperAbility.heal);
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive() && this != hero) {
        hero.health += healPoints;
      }
    }
  }
}
 
 
class Golem extends Hero {
  Golem(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.shield);
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    print('Golem $name stands firm, absorbing blows for the team!');
  }
}
 
class Lucky extends Hero {
  Lucky(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.dodge);
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    print('Lucky $name feels fortunate today!');
  }
}
 
class Witcher extends Hero {
  bool hasResurrected = false;
 
  Witcher(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.sacrifice);
 
  @override
  void attack(Boss boss) {
  
  }
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (!isAlive() || hasResurrected) return;
 
    Hero? deadHero = heroes.where((h) => !h.isAlive() && h != this).firstOrNull;
    if (deadHero == null) return;
 
    print('Witcher $name sacrificed himself to resurrect ${deadHero.name}!');
    deadHero.health = health;
    health = 0;
    hasResurrected = true;
  }
}
 
class Thor extends Hero {
  Thor(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.stun);
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('Thor $name stunned the boss!');
    }
  }
}
 
class Reaper extends Hero {
  Reaper(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.reap);
 
  @override
  void attack(Boss boss) {
    boss.health -= damage;
  }
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (health <= 0) return;
    int extra = 0;
    if (health < _maxHealth * 0.15) {
      extra = damage * 2; 
      print('Reaper $name is near death — TRIPLE damage! (+$extra)');
    } else if (health < _maxHealth * 0.30) {
      extra = damage; 
      print('Reaper $name is wounded — DOUBLE damage! (+$extra)');
    }
    if (extra > 0) boss.health -= extra;
  }
 
  late final int _maxHealth = health; 
}
 
class Bomber extends Hero {
  Bomber(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.explode);
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    print('Bomber $name is ready to explode if killed!');
  }
}
 
class Ludoman extends Hero {
  Ludoman(String name, int health, int damage)
      : super(name, health, damage, SuperAbility.gamble);
 
  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int die1 = RpgGame.random.nextInt(6) + 1;
    int die2 = RpgGame.random.nextInt(6) + 1;
    print('Ludoman $name rolls the dice: $die1 and $die2!');
 
    if (die1 == die2) {
      int product = die1 * die2;
      boss.health -= product;
      print('Ludoman $name matched! Boss takes $product damage!');
    } else {
      int sum = die1 + die2;
      List<Hero> alive = heroes.where((h) => h.isAlive() && h != this).toList();
      if (alive.isNotEmpty) {
        Hero unlucky = alive[RpgGame.random.nextInt(alive.length)];
        unlucky.health -= sum;
        print('Ludoman $name missed — ${unlucky.name} takes $sum friendly-fire damage!');
      }
    }
  }
}