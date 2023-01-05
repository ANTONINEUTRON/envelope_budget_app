// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Income _$IncomeFromJson(Map<String, dynamic> json) => Income(
      label: json['label'] as String,
      balance: (json['balance'] as num).toDouble(),
      incomeType: $enumDecode(_$IncomeTypeEnumMap, json['incomeType']),
    );

Map<String, dynamic> _$IncomeToJson(Income instance) => <String, dynamic>{
      'label': instance.label,
      'balance': instance.balance,
      'incomeType': _$IncomeTypeEnumMap[instance.incomeType]!,
    };

const _$IncomeTypeEnumMap = {
  IncomeType.cash_in_hand: 'cash_in_hand',
  IncomeType.bank: 'bank',
  IncomeType.wallet: 'wallet',
  IncomeType.card: 'card',
  IncomeType.others: 'others',
};
