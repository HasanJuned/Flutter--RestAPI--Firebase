import 'package:get/get.dart';

/// GetxController is a way of state management controller for creating state management controller
/// to control the state

class CounterController extends GetxController {
  int count = 0; /// this state need to change for every click

  void addMethod(){
    count++;
    update(); /// like setState
  }

  void minusMethod(){
    count--;
    update();
  }
}