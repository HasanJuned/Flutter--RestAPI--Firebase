import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/product_by_category_model.dart';
import 'package:ostad_flutter_batch_two/data/models/product_details_model.dart';
import 'package:ostad_flutter_batch_two/data/services/network_caller.dart';

class ProductController extends GetxController {

  bool _getProductsByCategoryInProgress = false;
  bool _getProductsDetailsInProgress = false;
  ProductByCategoryModel _productByCategoryModel = ProductByCategoryModel();
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  bool get getProductsByCategoryInProgress => _getProductsByCategoryInProgress;
  bool get getProductsDetailsInProgress => _getProductsDetailsInProgress;
  ProductByCategoryModel get productByCategoryModel => _productByCategoryModel;
  ProductDetailsModel get productDetailsModel => _productDetailsModel;


  Future<bool> getProductsByCategory(int categoryId) async {
    _getProductsByCategoryInProgress = true;
    update();
    
    final response = await NetworkCaller.getRequest(url: '/ListProductByCategory/$categoryId');
    _getProductsByCategoryInProgress = false;
    if(response.isSuccess){
      _productByCategoryModel = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }

  }

  Future<bool> getProductsDetails(int productId) async {
    _getProductsDetailsInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: '/ProductDetailsById/$productId');
    _getProductsDetailsInProgress = false;
    if(response.isSuccess){
      _productDetailsModel = ProductDetailsModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }

  }
}