import 'game_character.dart';
import 'super_ability.dart';
import 'hero.dart';
import 'rpg_game.dart';
 
class Boss extends GameCharacter {
  SuperAbility? defence;
  bool isStunned = false;
 
  Boss(super.name, super.health, super.damage);
 
  void attack(List<Hero> heroes) {
    Golem? golem = heroes.whereType<Golem>().where((g) => g.isAlive()).firstOrNull;
 
    for (var hero in heroes) {
      if (!hero.isAlive()) continue;
 
      if (hero is Lucky) {
        if (RpgGame.random.nextInt(100) < 25) {
          print('Lucky ${hero.name} dodged the attack!');
          continue;
        }
      }
 
      bool wasAlive = hero.isAlive();
 
      if (hero is Golem) {
        hero.health -= damage;
      } else if (golem != null && golem.isAlive()) {
        int absorbedByGolem = damage ~/ 5;
        int remainingDamage = damage - absorbedByGolem;
        golem.health -= absorbedByGolem;
        if (hero is Berserk && defence != SuperAbility.blockAndRevert) {
          int blocked = (RpgGame.random.nextInt(2) + 1) * 5;
          hero.blockedDamage = blocked;
          hero.health -= (remainingDamage - blocked);
        } else {
          hero.health -= remainingDamage;
        }
      } else {
        if (hero is Berserk && defence != SuperAbility.blockAndRevert) {
          int blocked = (RpgGame.random.nextInt(2) + 1) * 5;
          hero.blockedDamage = blocked;
          hero.health -= (damage - blocked);
        } else {
          hero.health -= damage;
        }
      }
 
      if (wasAlive && !hero.isAlive() && hero is Bomber) {
        health -= 100;
        print('Bomber ${hero.name} exploded and dealt 100 damage to the boss!');
      }
    }
  }
 
  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length);
    defence = variants[randomIndex];
  }
 
  @override
  String toString() {
    if (defence == null) {
      return '${super.toString()} defence: No Defence';
    } else {
      return '${super.toString()} defence: ${defence!.name}';
    }
  }
}