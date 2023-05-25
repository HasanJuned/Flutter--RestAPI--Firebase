class HomeSliderModel {
  String? msg;
  List<SlidersData>? sliders;

  HomeSliderModel({this.msg, this.sliders});

  HomeSliderModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliders = <SlidersData>[];
      json['data'].forEach((v) {
        sliders!.add(SlidersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    if (sliders != null) {
      data['data'] = sliders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SlidersData {
  int? id;
  String? title;
  String? shortDes;
  String? image;
  int? productId;
  String? createdAt;
  String? updatedAt;

  SlidersData(
      {this.id,
        this.title,
        this.shortDes,
        this.image,
        this.productId,
        this.createdAt,
        this.updatedAt});

  SlidersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    image = json['image'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['short_des'] = shortDes;
    data['image'] = image;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
