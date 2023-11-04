import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:volley_scoreboard/app/shared/enums/sets.dart';

class SelectSetController extends ValueNotifier<Sets> {
  SelectSetController() : super(Sets.one);

  void selectSet(Sets choosedSet) {
    value = choosedSet;
  }
}
