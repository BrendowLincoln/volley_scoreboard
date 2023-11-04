import 'package:flutter/material.dart';
import 'package:volley_scoreboard/app/components/select_set/select_set_controller.dart';
import 'package:volley_scoreboard/app/shared/colors.dart';
import 'package:volley_scoreboard/app/shared/enums/sets.dart';

class SelectSetWidget extends StatefulWidget {
  final Function? onSelectChange;

  const SelectSetWidget({super.key, this.onSelectChange});

  @override
  State<SelectSetWidget> createState() => _SelectSetWidgetState();
}

class _SelectSetWidgetState extends State<SelectSetWidget> {
  final SelectSetController widgetController = SelectSetController();

  @override
  Widget build(BuildContext context) {
    final SelectSetController controller = SelectSetController();

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth * 0.3,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            return SegmentedButton(
              style: ButtonStyle(
                  textStyle: const MaterialStatePropertyAll(
                      TextStyle(fontSize: 18.0, fontFamily: 'Anton')),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (Set<MaterialState> states) {
                    return states.contains(MaterialState.selected)
                        ? AppColors.colorAccent
                        : Colors.transparent;
                  }),
                  enableFeedback: false,
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                  foregroundColor:
                      const MaterialStatePropertyAll(Colors.white)),
              showSelectedIcon: false,
              segments: const <ButtonSegment<Sets>>[
                ButtonSegment<Sets>(value: Sets.one, label: Text('1 SET')),
                ButtonSegment<Sets>(value: Sets.three, label: Text('3 SETS')),
                ButtonSegment<Sets>(value: Sets.five, label: Text('5 SETS'))
              ],
              selected: <Sets>{value},
              onSelectionChanged: (Set<Sets> newSelection) {
                controller.selectSet(newSelection.first);
              },
            );
          },
        ),
      );
    });
  }
}
