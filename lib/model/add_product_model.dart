class Products_Req_Model{

}


class Products_Response_Model{

  int id;
  late String name;
  int category_id ;
  int owner_id ;
  late  String image_path;
  int therty;
  int fifteen;
  int quantity;
  int price;
  String expration_date;
  double phone_number;


  Products_Response_Model({
      required this.id,
      required this.name,
      required this.category_id,
      required this.owner_id,
      required this.image_path,
      required this.therty,
      required this.fifteen,
      required this.quantity,
      required this.price,
      required this.expration_date,
      required this.phone_number
  });

  factory Products_Response_Model.fromJson(Map<String, dynamic> jsondata) {
    return Products_Response_Model(
      id : jsondata['id'] ?? 0,
      name : jsondata['name'] ?? "" ,
      category_id : jsondata['category_id'] ?? 0,
      owner_id : jsondata['owner_id'] ?? 0,
      image_path: jsondata['image_path'] ?? "",
      therty : jsondata['therty'] ?? 0,
      fifteen : jsondata['fifteen'] ?? 0,
      quantity : jsondata['quantity'] ?? 0,
      price : jsondata['price'] ?? 0,
      expration_date : jsondata['expration_date'] ?? "" ,
      phone_number : jsondata['phone_number'] ?? 0,
    );
  }
}