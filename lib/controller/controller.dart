import 'package:get/get.dart';

class Controller extends GetxController {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    selectedIndex = index;
    update(["indexchange"]);
  }

  final quantity = 0.obs;
  void increment() => quantity.value++;
  void decrement() => quantity.value--;
  void reset() => quantity.value = 0;
}
