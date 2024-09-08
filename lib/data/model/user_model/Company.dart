import 'package:json_annotation/json_annotation.dart';
part 'Company.g.dart';
/// name : "Romaguera-Crona"
/// catchPhrase : "Multi-layered client-server neural-net"
/// bs : "harness real-time e-markets"

@JsonSerializable()
class CompanyModel {
  String? name;
  String? catchPhrase;
  String? bs;

  CompanyModel({
      this.name, 
      this.catchPhrase, 
      this.bs,});

  factory CompanyModel.fromJson(dynamic json) => _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

}