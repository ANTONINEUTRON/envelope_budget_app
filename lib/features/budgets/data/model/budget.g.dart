// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Budget _$BudgetFromJson(Map<String, dynamic> json) => Budget(
      label: json['label'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
      'label': instance.label,
      'deadline': instance.deadline.toIso8601String(),
      'amount': instance.amount,
    };
