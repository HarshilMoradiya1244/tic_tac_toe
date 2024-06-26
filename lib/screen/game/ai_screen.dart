import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screen/home/controller/home_controller.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              Image.asset(
                "assets/images/tic_tac_toe_bg.jpg",
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black12),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Play With Computer",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.50,
                    child: GridView.builder(
                      itemCount: controller.gridList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            if (controller.gridList[index].isEmpty &&
                                controller.winner.value.isEmpty) {
                              controller.gridList[index] = 'X';
                              controller.player.value++;
                              controller.checkWinner();
                              // controller.checkBotMove();
                              if (controller.winner.value.isEmpty) {
                                if (controller.player.value == 1) {
                                  controller.botMove();
                                } else {
                                  controller.checkBotWin();
                                }
                              }
                            }
                          },
                          child: Container(
                            height: 200,
                            width: 200,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "${controller.gridList[index]}",
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                    ),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Winner ${controller.winner.value}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.reset();
                    },
                    child: const SizedBox(
                      height: 30,
                      width: 80,
                      child: Row(
                        children: [Text("Re Play"), Icon(Icons.refresh)],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
