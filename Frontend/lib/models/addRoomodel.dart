class AddRoom {
  String name;
  String password;
  String passwordconfirm;
  String email;
  String phone;

  // String xyz;
  AddRoom(
      {this.name, this.password, this.passwordconfirm, this.email, this.phone});
  // factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);

  _$ModelToJson(AddRoom instance) => <String, dynamic>{
        'name': instance.name,
        'password': instance.password,
        'passwordconfirm': instance.passwordconfirm,
        'email': instance.email,
        'phone': instance.phone
      };
}
