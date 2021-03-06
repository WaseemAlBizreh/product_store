class RegisterRequestModel {
  late String name ;
  late String email ;
  late String password ;
  late String conf_password ;


  RegisterRequestModel(
      this.name,
      this.email,
      this.password,
      this.conf_password
      );

  Map<String ,dynamic> toJson(){
    Map<String,dynamic> infregister ={
      'name':name ,
      'email': email ,
      'password':password ,
      'password_confirmation':conf_password
    };
    return infregister;
  }
}
class RegisterResponseModel{
  bool role;
  late String name ;
  late String token ;

  RegisterResponseModel({
    required this.role,
    required this.name,
    required this.token,
  });

factory RegisterResponseModel.fromjson(Map<String, dynamic> jsondata){
  return RegisterResponseModel(
    role : jsondata['role'] ?? false,
    name : jsondata['name'] ?? "",
    token : jsondata['access_token'] ?? "",
  );
}
}