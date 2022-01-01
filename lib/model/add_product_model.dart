class Products_Req_Model {
  int category_id;
  late String expration_date;
  int price;
  int fifteen;
  int quantity;
  int therty;
  double phone_number;
  late String name;
  late String image_path;

  Products_Req_Model({
    required this.category_id,
    required this.expration_date,
    required this.price,
    required this.fifteen,
    required this.quantity,
    required this.therty,
    required this.phone_number,
    required this.name,
    required this.image_path
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> inf_product = {
      'category_id': category_id,
      'expration_date': expration_date,
      'price': price,
      'fifteen': fifteen,
      'quantity': quantity,
      'therty': therty,
      'phone_number': phone_number,
      'name': name,
      'image_path': image_path,
    };
    return inf_product;
  }
}

class Products_Res_Model {
  int id;
  late String name;
  int category_id;
  int owner_id;
  late String image_path;
  int therty;
  int fifteen;
  int quantity;
  int price;
  String expration_date;
  double phone_number;

  Products_Res_Model({
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

  factory Products_Res_Model.fromJson(Map<String, dynamic> jsondata) {
    return Products_Res_Model(
      id: jsondata['id'] ?? 0,
      name: jsondata['name'] ?? "",
      category_id: jsondata['category_id'] ?? 0,
      owner_id: jsondata['owner_id'] ?? 0,
      image_path: jsondata['image_path'] ?? "",
      therty: jsondata['therty'] ?? 0,
      fifteen: jsondata['fifteen'] ?? 0,
      quantity: jsondata['quantity'] ?? 0,
      price: jsondata['price'] ?? 0,
      expration_date: jsondata['expration_date'] ?? "",
      phone_number: jsondata['phone_number'] ?? 0,
    );
  }
}
