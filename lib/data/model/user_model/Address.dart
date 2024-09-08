import 'package:json_annotation/json_annotation.dart';
import 'Geo.dart';
part 'Address.g.dart';

/// street : "Kulas Light"
/// suite : "Apt. 556"
/// city : "Gwenborough"
/// zipcode : "92998-3874"
/// geo : {"lat":"-37.3159","lng":"81.1496"}

@JsonSerializable()
class AddressModel {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoModel? geo;

  AddressModel({
      this.street, 
      this.suite, 
      this.city, 
      this.zipcode, 
      this.geo,});

  factory AddressModel.fromJson(dynamic json) => _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

}