class LoginRequestModel {
  late String email ;
  late String password ;


  LoginRequestModel(
      this.email,
      this.password,
      );


  Map<String ,dynamic> toJson(){
    Map<String,dynamic> inf_register ={
      'email': email,
      'password':password ,
    };
    return inf_register;
  }

}
class loginResponseModel{
  int id ;
  late String name ;
  bool role;
  late String token ;


  loginResponseModel({
    required this.id,
    required this.name,
    required this.role,
    required this.token,
  });


  factory loginResponseModel.fromJson(Map<String, dynamic> jsondata) {
    return loginResponseModel(
      id : jsondata['id'] ?? 0,
      name : jsondata['name'] ?? "" ,
      role : jsondata['role'] ?? false,
      token : jsondata['token'] ?? "",
    );
  }
}