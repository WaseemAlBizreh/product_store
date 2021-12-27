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
  late bool role;
  late String name ;
  late String token ;
  late int stateuscode ;

  RegisterResponseModel(
      this.role,
      this.name,
      this.token,
      this.stateuscode);


}