import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volley_scoreboard/app/components/select_set/select_set_widget.dart';
import 'package:volley_scoreboard/app/controllers/home_page_controller.dart';
import 'package:volley_scoreboard/app/shared/constants/colors.dart';
import 'package:volley_scoreboard/app/shared/enums/quantity_sets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final homeController = HomePageController();

    List<Widget> generateLayout(QuantitySets quantitySets) {
      int quantityToRender = 1;
      List<Widget> widgets = [];

      switch (quantitySets) {
        case QuantitySets.one:
          quantityToRender = 1;
          break;
        case QuantitySets.three:
          quantityToRender = 3;
          break;
        case QuantitySets.five:
          quantityToRender = 5;
          break;
        default:
          quantityToRender = 1;
          break;
      }

      for (var i = 0; i < quantityToRender; i++) {
        widgets.add(
          Container(
              height: screenHeight * 0.13,
              width: screenHeight * 0.13,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.colorAccent, width: 1),
              )),
        );
      }

      return widgets;
    }

    return Material(
      child: Container(
        color: AppColors.background,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.15,
              child: ValueListenableBuilder(
                  valueListenable: homeController.$selectedSetQuantityNotifier,
                  builder: (context, value, __) {
                    return SelectSetWidget(
                        value: value,
                        onSelectChange: (event) =>
                            homeController.changeSetQuantity(event));
                  }),
            ),
            Container(
              width: screenWidth,
              height: screenHeight * 0.85,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 1),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: ValueListenableBuilder(
                      valueListenable:
                          homeController.$selectedSetQuantityNotifier,
                      builder: (context, value, child) => Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.colorAccent, width: 1),
                            borderRadius: BorderRadius.circular(5.0)),
                        width: screenWidth * 0.06,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: generateLayout(value),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
