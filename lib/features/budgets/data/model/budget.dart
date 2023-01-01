import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'expense.dart';
part 'budget.g.dart';

@JsonSerializable()
class Budget extends Equatable{
  final DateTime timeAdded = DateTime.now();
  String label;
  final DateTime deadline;
  final double amount;
  final List<Expense> expenses = [];

  Budget({
    required this.label,
    required this.deadline,
    required this.amount,
  });

  @override
  List<Object?> get props => [timeAdded];

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetToJson(this);
}