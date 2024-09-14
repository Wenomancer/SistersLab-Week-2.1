// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

import 'TradeModel.dart';

TradeModel $TradeModelFromJson(Map<String, dynamic> json) => TradeModel(
      e: json['e'] as String?,
      E: (json['E'] as num?)?.toInt(),
      s: json['s'] as String?,
      t: (json['t'] as num?)?.toInt(),
      p: json['p'] as String?,
      q: json['q'] as String?,
      T: (json['T'] as num?)?.toInt(),
      m: json['m'] as bool?,
      M: json['M'] as bool?,
    );

Map<String, dynamic> $TradeModelToJson(TradeModel instance) =>
    <String, dynamic>{
      'e': instance.e,
      'E': instance.E,
      's': instance.s,
      't': instance.t,
      'p': instance.p,
      'q': instance.q,
      'T': instance.T,
      'm': instance.m,
      'M': instance.M,
    };
