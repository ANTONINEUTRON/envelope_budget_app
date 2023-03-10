import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'expense.dart';
part 'budget.g.dart';

@JsonSerializable()
class Budget extends Equatable{
  final DateTime id;
  String label;
  final DateTime deadline;
  final double amount;
  final List<Expense> expenses;
  bool hasBudgetExceededAlertShown;

  Budget({
    required this.id,
    required this.label,
    required this.deadline,
    required this.amount,
    this.expenses = const [],
    this.hasBudgetExceededAlertShown = false
  });

  @override
  List<Object?> get props => [id];


  @override
  bool get stringify {
    return true;
  }

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetToJson(this);

  double getAmountSpent() {
    double amount = 0;
    expenses.forEach((expense) {
      amount += expense.amount;
    });
    return amount;
  }

  double getRemsAmount() => amount - getAmountSpent();
}