import 'Address.dart';

import 'package:json_annotation/json_annotation.dart';
import 'Company.dart';
part 'UserModel.g.dart';

/// id : 1
/// name : "Leanne Graham"
/// username : "Bret"
/// email : "Sincere@april.biz"
/// address : {"street":"Kulas Light","suite":"Apt. 556","city":"Gwenborough","zipcode":"92998-3874","geo":{"lat":"-37.3159","lng":"81.1496"}}
/// phone : "1-770-736-8031 x56442"
/// website : "hildegard.org"
/// company : {"name":"Romaguera-Crona","catchPhrase":"Multi-layered client-server neural-net","bs":"harness real-time e-markets"}

@JsonSerializable()
class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  AddressModel? address;
  String? phone;
  String? website;
  CompanyModel? company;

  UserModel({
      this.id, 
      this.name, 
      this.username, 
      this.email, 
      this.address, 
      this.phone, 
      this.website, 
      this.company,});

  factory UserModel.fromJson(dynamic json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}