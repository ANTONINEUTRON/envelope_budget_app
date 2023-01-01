import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'expense.g.dart';

@JsonSerializable()
class Expense extends Equatable{
  final DateTime timeAdded;
  final double amount;
  String label;

  Expense({
    required this.timeAdded,
    required this.amount,
    required this.label
  });

  @override
  // TODO: implement props
  List<Object?> get props => [timeAdded];

  factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}