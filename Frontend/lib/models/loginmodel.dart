// import 'package:json_annotation/json_annotation.dart';

// part 'model.g.dart';

class Model {
  String email;
  String password;
  // String xyz;
  Model({this.email, this.password});
  // factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);

  _$ModelToJson(Model instance) => <String, dynamic>{
        'email': instance.email,
        'password': instance.password,
      };
}
// Model _$ModelFromJson(Map<String, dynamic> json) {
//   return Model(
//     email: json['name'] as String,
//     password: json['phonenumber'] as String,
//   );
// }
