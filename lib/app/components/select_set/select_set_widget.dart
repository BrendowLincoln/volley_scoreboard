import 'package:flutter/material.dart';
import 'package:volley_scoreboard/app/shared/constants/colors.dart';
import 'package:volley_scoreboard/app/shared/constants/strings.dart';
import 'package:volley_scoreboard/app/shared/enums/quantity_sets.dart';

class SelectSetWidget extends StatefulWidget {
  final QuantitySets value;
  final Function(QuantitySets)? onSelectChange;

  const SelectSetWidget({super.key, required this.value, this.onSelectChange});

  @override
  State<SelectSetWidget> createState() => _SelectSetWidgetState();
}

class _SelectSetWidgetState extends State<SelectSetWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth * 0.3,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SegmentedButton(
            style: ButtonStyle(
                textStyle: const MaterialStatePropertyAll(
                    TextStyle(fontSize: 18.0, fontFamily: 'Anton')),
                backgroundColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  return states.contains(MaterialState.selected)
                      ? AppColors.colorAccent
                      : Colors.transparent;
                }),
                enableFeedback: false,
                shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                foregroundColor: const MaterialStatePropertyAll(Colors.white)),
            showSelectedIcon: false,
            segments: const <ButtonSegment<QuantitySets>>[
              ButtonSegment<QuantitySets>(
                  value: QuantitySets.one, label: Text(Strings.oneSet)),
              ButtonSegment<QuantitySets>(
                  value: QuantitySets.three, label: Text(Strings.threeSet)),
              ButtonSegment<QuantitySets>(
                  value: QuantitySets.five, label: Text(Strings.fiveSet))
            ],
            selected: <QuantitySets>{widget.value},
            onSelectionChanged: (value) {
              widget.onSelectChange!(value.first);
            }),
      );
    });
  }
}
