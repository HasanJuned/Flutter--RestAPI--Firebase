import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/auth_controller.dart';

import '../../data/services/network_caller.dart';

class WishListController extends GetxController {
  bool _addNewItemsInProgress = false;

  bool get addNewItemsInProgress => _addNewItemsInProgress;

  Future<bool> addWishList(int productId) async {
    _addNewItemsInProgress = true;
    update();

    final response =
        await NetworkCaller.getRequest(url: '/CreateWishList/$productId');
    _addNewItemsInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      if(response.statusCode == 401){
        Get.find<AuthController>().logOut();
      }
      update();
      return false;
    }
  }
}
