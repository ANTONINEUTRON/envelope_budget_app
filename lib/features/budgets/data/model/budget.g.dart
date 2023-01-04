// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Budget _$BudgetFromJson(Map<String, dynamic> json) => Budget(
      id: DateTime.parse(json['id'] as String),
      label: json['label'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
      amount: (json['amount'] as num).toDouble(),
      expenses: (json['expenses'] as List<dynamic>?)
              ?.map((e) => Expense.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
      'id': instance.id.toIso8601String(),
      'label': instance.label,
      'deadline': instance.deadline.toIso8601String(),
      'amount': instance.amount,
      'expenses': instance.expenses,
    };
