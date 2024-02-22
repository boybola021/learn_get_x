


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetXStorageLearn extends StatefulWidget {
  const GetXStorageLearn({super.key});

  @override
  State<GetXStorageLearn> createState() => _GetXStorageLearnState();
}

class _GetXStorageLearnState extends State<GetXStorageLearn> {
  var storage = GetStorage();
  final controller = TextEditingController();
  String storageText = "";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                hintText: "Enter email"
              ),
            ),

          ),
          OutlinedButton(
              onPressed: (){
                if(GetUtils.isEmail(controller.text.trim())){
                  storage.write("Email", controller.text.trim());
                  Get.snackbar(
                      "Successful save email", "",
                      colorText: Colors.white,backgroundColor: Colors.green,snackPosition: SnackPosition.BOTTOM);
                      controller.clear();
                }else{
                  Get.snackbar(
                      "Incorrect Email", "Provider email in valid format",
                      colorText: Colors.white,backgroundColor: Colors.red,snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: const Text("Write",style: TextStyle(fontSize: 20),),
          ),
          const SizedBox(height: 20,),
          OutlinedButton(
            onPressed: ()async{
              storageText = await storage.read("Email");
              setState(() {});
            },
            child: const Text("Read",style: TextStyle(fontSize: 20),),
          ),
          const SizedBox(height: 30,),
          Text("Storage read email => $storageText",textAlign: TextAlign.center,style: const TextStyle(fontSize: 25,color: Colors.black),)
        ],
      ),
    );
  }
}
