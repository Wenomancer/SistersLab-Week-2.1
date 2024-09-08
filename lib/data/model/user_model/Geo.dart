import 'package:json_annotation/json_annotation.dart';
part 'Geo.g.dart';

/// lat : "-37.3159"
/// lng : "81.1496"

@JsonSerializable()
class GeoModel {
  String? lat;
  String? lng;

  GeoModel({
      this.lat, 
      this.lng,});

  factory GeoModel.fromJson(dynamic json) => _$GeoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoModelToJson(this);

}