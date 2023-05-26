import 'package:get/get.dart';

import '../../data/models/product_by_category_model.dart';
import '../../data/services/network_caller.dart';

class SpecialProductByRemarkController extends GetxController {

  bool _getSpecialProductByRemarkInProgress = false;
  ProductByCategoryModel _specialProductModel = ProductByCategoryModel();

  bool get getSpecialProductByRemarkInProgress => _getSpecialProductByRemarkInProgress;
  ProductByCategoryModel get specialProductModel => _specialProductModel;



  Future<bool> getSpecialProductsByRemark() async {
    _getSpecialProductByRemarkInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/special');
    _getSpecialProductByRemarkInProgress = false;

    if (response.isSuccess) {
      _specialProductModel = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}