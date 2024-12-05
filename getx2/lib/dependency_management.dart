import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyController extends GetxController {
  var counter = 0.obs; // Perbaikan: Penggunaan koma diganti titik, dan "obs" harus berada di akhir variabel.

  void increment() {
    counter++;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // Perbaikan: "widget" diganti dengan "Widget" karena case-sensitive.
    Get.put(MyController()); // Dependency Injection menggunakan Get.put().

    return GetMaterialApp( // Perbaikan: Digunakan GetMaterialApp untuk mendukung fitur GetX.
      home: Scaffold(
        appBar: AppBar(title: Text("Manajemen Dependency dengan GetX")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() { // Obx untuk memantau perubahan pada variabel reaktif.
                return Text(
                  "Counter: ${Get.find<MyController>().counter}", // Mengakses controller menggunakan Get.find().
                  style: TextStyle(fontSize: 24),
                );
              }),
              ElevatedButton(
                onPressed: () {
                  Get.find<MyController>().increment(); // Memanggil fungsi increment pada controller.
                },
                child: Text("Increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
