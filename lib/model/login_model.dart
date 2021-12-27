class LoginRequestModel {
  late String email ;
  late String password ;


  LoginRequestModel(
      this.email,
      this.password,
      );

  Map<String ,dynamic> toJson(){
    Map<String,dynamic> infregister ={
      'email': email,
      'password':password ,
    };
    return infregister;
  }

}

class loginResponseModel{
  late bool role;
  late String name ;
  late String token ;
  late int stateuscode ;

  loginResponseModel({
    required this.role,
    required this.name,
    required this.token,
    required this.stateuscode,
  });

  factory loginResponseModel.fromJson(Map<String, dynamic> jsondata) {
    return loginResponseModel(
      role : jsondata['role'],
      name : jsondata['name'],
      token : jsondata['token'],
      stateuscode : jsondata['stateuscode'],
    );
  }
}