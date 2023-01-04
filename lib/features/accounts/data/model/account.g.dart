// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      label: json['label'] as String,
      balance: (json['balance'] as num).toDouble(),
      accountType: $enumDecode(_$AccountTypeEnumMap, json['accountType']),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'label': instance.label,
      'balance': instance.balance,
      'accountType': _$AccountTypeEnumMap[instance.accountType]!,
    };

const _$AccountTypeEnumMap = {
  AccountType.bank: 'bank',
  AccountType.card: 'card',
  AccountType.others: 'others',
};
