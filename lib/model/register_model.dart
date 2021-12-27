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
      'email': email,
      'password':password ,
      'conf_password':conf_password
    };
    return infregister;
  }
}
class RegisterResponseModel{
  bool role;
  late String name ;
  late String token ;
  int stateuscode ;

  RegisterResponseModel({
      required this.role,
    required this.name,
    required this.token,
    required this.stateuscode
  });

factory RegisterResponseModel.fromjson(Map<String, dynamic> jsondata){
  return RegisterResponseModel(
    role : jsondata['role'],
    name : jsondata['name'],
    token : jsondata['token'],
    stateuscode : jsondata['stateuscode'],
  );
}
}