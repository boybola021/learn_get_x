import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXLearn extends StatelessWidget {
  const GetXLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "GetX Learn",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: OutlinedButton(
              onPressed: () {
                /// # GetX Snackbar Learn
                Get.snackbar(
                  "Hello word",
                  "This will be Snackbar Message",
                  snackPosition: SnackPosition.BOTTOM,
                  //titleText: const Text("Assalomu Aleykum",),
                  //messageText: const Text("Bu snakbar message")
                  colorText: Colors.red,
                  animationDuration: const Duration(seconds: 2),

                  /// # Snackbarni surish uchun ishaltiladi
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,

                  /// #Turi xilAnimation uchun
                  forwardAnimationCurve: Curves.bounceInOut,
                  icon: const Icon(Icons.send),

                  /// #Left tomonidan qushimcha button
                  mainButton:
                  TextButton(onPressed: () {}, child: const Text("Retry")),

                  /// #button bosgandagi natijani kursatadi
                  onTap: (value) {
                    debugPrint("Value => $value");
                    debugPrint("Snack cliced");
                  },

                  /// # Snacbar chiqandi backround ni hiralashtirib quyadi
                  overlayBlur: 5,

                  /// #Bu ham snackbar tepasida ranglar aylanib turushini taminalaydi
                  showProgressIndicator: true,
                  progressIndicatorBackgroundColor: Colors.deepOrange,

                  /// TextFild dan foydalanasa buladi
                  // duration: const Duration(seconds: 5),
                  // userInputForm: const Form(
                  //   child: Row(
                  //     children: [
                  //       Expanded(child: TextField()),
                  //     ],
                  //   ),
                  // )
                );
              },
              child: const Text(
                "Button",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: OutlinedButton(
              onPressed: () {
                Get.bottomSheet(SizedBox(
                  child: Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.wb_sunny_outlined,
                          size: 30,
                        ),
                        title: const Text(
                          "Light Theme",
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () => Get.changeThemeMode(ThemeMode.light),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.wb_sunny,
                          size: 30,
                        ),
                        title: const Text(
                          "Dark Theme",
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () => Get.changeThemeMode(ThemeMode.dark),
                      ),
                    ],
                  ),
                ));
              },
              child: const Text(
                "Bottom Sheet",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          OutlinedButton(
            onPressed: () async{
              var data = await Get.to(
                const TestPage(),
                arguments: "Hello everyone",
                fullscreenDialog: true,
                /// Animation bulib ochiladi keyingi page lar
                //transition: Transition.zoom,
                //transition: Transition.size,
                //transition: Transition.circularReveal,
                //transition: Transition.fade,
                // transition: Transition.fadeIn,
                // transition: Transition.leftToRight,
                //transition: Transition.native,
                transition: Transition.cupertino,
                // transition: Transition.cupertinoDialog,
                //transition: Transition.downToUp,
                duration: const Duration(seconds: 4),
                // curve: Curves.bounceInOut,

              );
              debugPrint("Result Data => $data");
            },
            child: const Text(
              "Next Page",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});
  static var count = 0.obs;

  void increment() => count++;
  void decrement() => count--;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(Get.arguments,style: const TextStyle(fontSize: 22),),
            ),
            OutlinedButton(
              onPressed: () => Get.back(result: "Okay lest go"),
              child: const Text(
                "Back",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox( height: 30,),
            /// #Obx bu uzi turgan joynigina bulid qiladi va app nio tez ishlashiga yordam beradi
            Obx(() =>  Text(
              count.toString(),
              style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(onPressed: () => increment(), icon: const Icon(Icons.add,size: 25,)),
                const SizedBox(width: 20,),
                IconButton.filled(onPressed: () => decrement(), icon: const Icon(Icons.remove,size: 25,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}