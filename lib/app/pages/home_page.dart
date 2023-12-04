import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volley_scoreboard/app/components/select_set/select_set_widget.dart';
import 'package:volley_scoreboard/app/components/side_score/side_score_widget.dart';
import 'package:volley_scoreboard/app/controllers/home_page_controller.dart';
import 'package:volley_scoreboard/app/shared/constants/colors.dart';

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

    return Material(
      child: Container(
        height: screenHeight * 0.2,
        color: AppColors.background,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                child: ValueListenableBuilder(
                    valueListenable:
                        homeController.$selectedSetQuantityNotifier,
                    builder: (context, value, __) {
                      return SelectSetWidget(
                          value: value,
                          onSelectChange: (event) =>
                              homeController.changeSetQuantity(event));
                    }),
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight * 0.80,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: ValueListenableBuilder(
                      valueListenable:
                          homeController.$selectedSetQuantityNotifier,
                      builder: (context, value, child) =>
                          SideScore(chosedSets: value),
                    ),
                  ),
                  SingleChildScrollView(
                    child: ValueListenableBuilder(
                      valueListenable:
                          homeController.$selectedSetQuantityNotifier,
                      builder: (context, value, child) =>
                          SideScore(chosedSets: value),
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
