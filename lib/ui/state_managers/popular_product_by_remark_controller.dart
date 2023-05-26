import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/product_by_remarks_model.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';

class PopularProductByRemarkController extends GetxController {
  bool _getPopularProductByRemarkInProgress = false;
  ProductByRemarksModel _popularProductModel = ProductByRemarksModel();


  bool get getPopularProductByRemarkInProgress => _getPopularProductByRemarkInProgress;
  ProductByRemarksModel get popularProductModel => _popularProductModel;

  Future<bool> getPopularProductsByRemark() async {
    _getPopularProductByRemarkInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/popular');
    _getPopularProductByRemarkInProgress = false;

    if (response.isSuccess) {
      _popularProductModel =
          ProductByRemarksModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }


}
