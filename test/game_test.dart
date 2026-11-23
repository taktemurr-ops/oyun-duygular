import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_duygular/oyun_duygular.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(duygularConfig.title.length, 33);
    expect(duygularConfig.tagline.length, 33);
    for (final s in duygularConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(duygularConfig.gameId, duygularId);
    expect(duygularRules.gameId, duygularId);
    expect(duygularConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(duygularRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: duygularId, optionalMechanics: duygularRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(duygularRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
