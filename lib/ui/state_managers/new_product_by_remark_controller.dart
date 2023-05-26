import 'package:get/get.dart';

import '../../data/models/product_by_remarks_model.dart';
import '../../data/services/network_caller.dart';

class NewProductByRemarkController extends GetxController {

  bool _getNewProductByRemarkInProgress = false;
  ProductByRemarksModel _newProductModel = ProductByRemarksModel();

  bool get getNewProductByRemarkInProgress => _getNewProductByRemarkInProgress;
  ProductByRemarksModel get newProductModel => _newProductModel;



  Future<bool> getNewProductsByRemark() async {
    _getNewProductByRemarkInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/new');
    _getNewProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _newProductModel = ProductByRemarksModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}