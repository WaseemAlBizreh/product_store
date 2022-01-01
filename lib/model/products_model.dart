class Products_Req_Model{

}


class Products_Response_Model{

  late String name;
  int id ;
  late  String image_path;

  Products_Response_Model({
    required this.name,
    required this.id,
    required this.image_path
  });

  factory Products_Response_Model.fromJson(Map<String, dynamic> jsondata) {
    return Products_Response_Model(
      name : jsondata['name'] ?? "" ,
      id : jsondata['id'] ?? 0,
      image_path: jsondata['image_path'] ?? "",
    );
  }
}

class product_list_view {
  late List<dynamic> products;

  product_list_view({
    required this.products
  });

  factory product_list_view.fromJson(jsonData) {
    return product_list_view(
      products: jsonData,
    );
  }
}