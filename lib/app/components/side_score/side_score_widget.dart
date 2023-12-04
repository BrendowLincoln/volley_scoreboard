import 'package:flutter/material.dart';
import 'package:volley_scoreboard/app/shared/constants/colors.dart';
import 'package:volley_scoreboard/app/shared/enums/quantity_sets.dart';

class SideScore extends StatelessWidget {
  final QuantitySets chosedSets;
  final double screenHeight;
  final double screenWidth;

  const SideScore(
      {required this.chosedSets,
      this.screenHeight = 450.0,
      this.screenWidth = 1000.0,
      super.key});

  List<Widget> generateLayout(QuantitySets quantitySets) {
    return List.generate(quantitySets.numericValue, (index) {
      return Container(
        height: screenHeight * 0.13,
        width: screenHeight * 0.13,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.colorAccent, width: 1),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.colorAccent, width: 1),
          borderRadius: BorderRadius.circular(5.0)),
      width: screenWidth * 0.06,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: generateLayout(chosedSets),
      ),
    );
  }
}
