import 'package:flutter/material.dart';
import 'package:volley_scoreboard/app/shared/enums/sets.dart';

class HomePageController {
  final ValueNotifier<Sets> $selectedSetQuantityNotifier =
      ValueNotifier(Sets.one);

  Sets get selectedSet => $selectedSetQuantityNotifier.value;

  HomePageController();
}
