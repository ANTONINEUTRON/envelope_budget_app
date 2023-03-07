// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Income _$IncomeFromJson(Map<String, dynamic> json) => Income(
      label: json['label'] as String,
      balance: (json['balance'] as num).toDouble(),
      incomeType: $enumDecode(_$CardProviderEnumMap, json['incomeType']),
    );

Map<String, dynamic> _$IncomeToJson(Income instance) => <String, dynamic>{
      'label': instance.label,
      'balance': instance.balance,
      'incomeType': _$CardProviderEnumMap[instance.incomeType]!,
    };

const _$CardProviderEnumMap = {
  CardProvider.visa: 'visa',
  CardProvider.mastercard: 'mastercard',
  CardProvider.verve: 'verve',
};
