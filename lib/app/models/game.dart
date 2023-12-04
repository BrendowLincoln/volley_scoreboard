import 'package:volley_scoreboard/app/models/set_point.dart';
import 'package:volley_scoreboard/app/models/team.dart';
import 'package:volley_scoreboard/app/shared/enums/quantity_sets.dart';

class Game {
  final Team firstTeam;
  final Team secondTeam;
  final QuantitySets quantitySets;
  final List<SetPoint> setPoints;
  final int currentSet;
  final bool isGameEnd;

  Game(
      {required this.firstTeam,
      required this.secondTeam,
      required this.quantitySets,
      required this.setPoints,
      required this.currentSet,
      this.isGameEnd = false});
}
  
// void _validateSet(QuantitySets quantitySet, List<GameSetTeam> sets) {
//   if (quantitySet == QuantitySets.one && sets.length != 1) {
//     throw ArgumentError("Precisa ter apenas 1 SET!");
//   }
//   if (quantitySet == QuantitySets.three && sets.length != 3) {
//     throw ArgumentError("Precisa ter apenas 3 SETS!");
//   }
//   if (quantitySet == QuantitySets.five && sets.length != 5) {
//     throw ArgumentError("Precisa ter apenas 5 SETS!");
//   }
// }
