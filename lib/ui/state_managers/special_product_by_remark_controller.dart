import 'package:get/get.dart';

import '../../data/models/product_by_remarks_model.dart';
import '../../data/services/network_caller.dart';

class SpecialProductByRemarkController extends GetxController {

  bool _getSpecialProductByRemarkInProgress = false;
  ProductByRemarksModel _specialProductModel = ProductByRemarksModel();

  bool get getSpecialProductByRemarkInProgress => _getSpecialProductByRemarkInProgress;
  ProductByRemarksModel get specialProductModel => _specialProductModel;



  Future<bool> getSpecialProductsByRemark() async {
    _getSpecialProductByRemarkInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/special');
    _getSpecialProductByRemarkInProgress = false;

    if (response.isSuccess) {
      _specialProductModel = ProductByRemarksModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}