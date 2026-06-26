import 'boss.dart';
import 'hero.dart';
import 'dart:math';
 
class RpgGame {
  static Random random = Random();
  static int roundNumber = 0;
 
  static void startGame() {
    Boss boss = Boss('Org', 1000, 50);
 
    Warrior warrior1 = Warrior('Alpha', 280, 15);
    Warrior warrior2 = Warrior('Jack', 270, 20);
    Magic magic = Magic('Merlin', 290, 10);
    Berserk berserk = Berserk('Gutz', 260, 10);
    Medic doc = Medic('Haus', 250, 5, 15);
    Medic assistant = Medic('Retchet', 300, 5, 5);
    Golem golem = Golem('Rock', 500, 8);
    Lucky lucky = Lucky('Jew', 220, 12);
    Witcher witcher = Witcher('Vedmak', 240, 0);
    Thor thor = Thor('Mlolniya', 260, 18);
    Reaper reaper = Reaper('CMEPTb', 200, 25);
    Bomber bomber = Bomber('Boomer', 180, 10);
    Ludoman ludoman = Ludoman('Mellstroy', 230, 12);
 
    List<Hero> heroes = [
      warrior1,
      doc,
      warrior2,
      magic,
      berserk,
      assistant,
      golem,
      lucky,
      witcher,
      thor,
      reaper,
      bomber,
      ludoman,
    ];
 
    _showStatistics(boss, heroes);
    while (!_isGameOver(boss, heroes)) {
      _playRound(boss, heroes);
    }
  }
 
  static bool _isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('Heroes won!!!');
      return true;
    }
    bool allHeroesDead = heroes.every((h) => !h.isAlive());
    if (allHeroesDead) {
      print('Boss won!!!');
      return true;
    }
    return false;
  }
 
  static void _playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;
    print('\n=== ROUND $roundNumber ===');
 
    boss.chooseDefence();
 
    if (boss.isStunned) {
      print('Boss is stunned and skips this round!');
      boss.isStunned = false;
    } else {
      boss.attack(heroes);
    }
 
    for (var hero in heroes) {
      if (hero.isAlive() && boss.isAlive() && boss.defence != hero.ability) {
        hero.attack(boss);
        hero.applySuperPower(boss, heroes);
      }
    }
 
    _showStatistics(boss, heroes);
  }
 
  static void _showStatistics(Boss boss, List<Hero> heroes) {
    print('ROUND $roundNumber ---------------');
    print(boss);
    for (var hero in heroes) {
      print(hero);
    }
  }
}