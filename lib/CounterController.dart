import 'package:get/get.dart';

class CounterController extends GetxController{
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