import 'package:binaural/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:binaural/home_controller.dart';

enum PlayerStates {
  disabled,
  playable,
  playing,
}

class Home extends StatelessWidget {
  Home({super.key});

  final myController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    //myController.checkHeadsetsAtStart();
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      //backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 86, 214),
        title: const Center(child: Text('Binaural Beats')),
      ),
      body: GetBuilder<HomeController>(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.2,
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  myController
                      .transitionPlayableState(myController.playerState.value);
                },
                child: CircleButton(playColor: myController.playerColor.value),
              ),
            ),
          ],
        );
      }),
    );
  }
}
