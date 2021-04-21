class RegisterModel {
  String name;
  String password;
  String passwordconfirm;
  String email;
  String phone;
  String address;
  int isAdmin;

  // String xyz;
  RegisterModel(
      {this.name,
      this.password,
      this.passwordconfirm,
      this.email,
      this.phone,
      this.address,
      this.isAdmin});
  // factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);

  _$ModelToJson(RegisterModel instance) => <String, dynamic>{
        'name': instance.name,
        'password': instance.password,
        'passwordconfirm': instance.passwordconfirm,
        'email': instance.email,
        'phone': instance.phone,
        'address': instance.address,
        'isAdmin': instance.isAdmin
      };
}
// Model _$ModelFromJson(Map<String, dynamic> json) {
//   return Model(
//     email: json['name'] as String,
//     password: json['phonenumber'] as String,
//   );
// }
