// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CCard _$CCardFromJson(Map<String, dynamic> json) => CCard(
      name: json['name'] as String,
      number: json['number'] as String,
      provider: json['provider'] as String,
      cvv: json['cvv'] as String,
      expiryDate: json['expiryDate'] as String,
    );

Map<String, dynamic> _$CCardToJson(CCard instance) => <String, dynamic>{
      'name': instance.name,
      'number': instance.number,
      'provider': instance.provider,
      'cvv': instance.cvv,
      'expiryDate': instance.expiryDate,
    };
