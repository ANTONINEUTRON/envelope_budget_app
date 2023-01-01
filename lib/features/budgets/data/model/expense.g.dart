// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
      id: DateTime.parse(json['id'] as String),
      amount: (json['amount'] as num).toDouble(),
      label: json['label'] as String,
    );

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
      'id': instance.id.toIso8601String(),
      'amount': instance.amount,
      'label': instance.label,
    };
