import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/product_by_category_model.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';

class PopularProductByRemarkController extends GetxController {
  bool _getPopularProductByRemarkInProgress = false;
  ProductByCategoryModel _popularProductModel = ProductByCategoryModel();


  bool get getPopularProductByRemarkInProgress => _getPopularProductByRemarkInProgress;
  ProductByCategoryModel get popularProductModel => _popularProductModel;

  Future<bool> getPopularProductsByRemark() async {
    _getPopularProductByRemarkInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/popular');
    _getPopularProductByRemarkInProgress = false;

    if (response.isSuccess) {
      _popularProductModel =
          ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }


}
