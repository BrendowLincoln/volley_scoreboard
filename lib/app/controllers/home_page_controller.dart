import 'package:flutter/material.dart';
import 'package:volley_scoreboard/app/models/game.dart';
import 'package:volley_scoreboard/app/models/set_point.dart';
import 'package:volley_scoreboard/app/models/team.dart';
import 'package:volley_scoreboard/app/shared/enums/quantity_sets.dart';

class HomePageController {
  final ValueNotifier<QuantitySets> $selectedSetQuantityNotifier =
      ValueNotifier(QuantitySets.one);

  final ValueNotifier<Game> $gameNotifier = ValueNotifier(Game(
      firstTeam: Team("Team 1"),
      secondTeam: Team("Team 2"),
      quantitySets: QuantitySets.one,
      setPoints: [SetPoint(1, 0)],
      currentSet: 1));

  final List<SetPoint> _sets = [SetPoint(1, 0)];

  QuantitySets get selectedSet => $selectedSetQuantityNotifier.value;

  HomePageController();

  void changeSetQuantity(QuantitySets quantitySets) {
    $selectedSetQuantityNotifier.value = quantitySets;
  }
}
