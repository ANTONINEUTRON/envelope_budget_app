// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
      timeAdded: DateTime.parse(json['timeAdded'] as String),
      amount: (json['amount'] as num).toDouble(),
      label: json['label'] as String,
    );

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
      'timeAdded': instance.timeAdded.toIso8601String(),
      'amount': instance.amount,
      'label': instance.label,
    };
