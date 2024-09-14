import 'package:json_annotation/json_annotation.dart';
import 'TradeModel.g.dart';
/// e : "trade"
/// E : 1672515782136
/// s : "BNBBTC"
/// t : 12345
/// p : "0.001"
/// q : "100"
/// T : 1672515782136
/// m : true
/// M : true

@JsonSerializable()
class TradeModel {
  @JsonKey(name: 'e')
  String? e;
  @JsonKey(name: 'E')
  int? E;
  @JsonKey(name: 's')
  String? s;
  @JsonKey(name: 't')
  int? t;
  @JsonKey(name: 'p')
  String? p;
  @JsonKey(name: 'q')
  String? q;
  @JsonKey(name: 'T')
  int? T;
  @JsonKey(name: 'm')
  bool? m;
  @JsonKey(name: 'M')
  bool? M;

  TradeModel({
    this.e,
    this.E,
    this.s,
    this.t,
    this.p,
    this.q,
    this.T,
    this.m,
    this.M,
  });

  factory TradeModel.fromJson(dynamic json) => $TradeModelFromJson(json);

  Map<String, dynamic> toJson() => $TradeModelToJson(this);
}
