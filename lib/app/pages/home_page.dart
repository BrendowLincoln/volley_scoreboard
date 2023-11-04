import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volley_scoreboard/app/components/select_set/select_set_widget.dart';
import 'package:volley_scoreboard/app/controllers/home_page_controller.dart';
import 'package:volley_scoreboard/app/shared/colors.dart';

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
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          color: AppColors.background,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.15,
                child: SelectSetWidget(),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.85,
                color: Colors.brown,
              )
            ],
          ),
        ),
      ),
    );
  }
}
