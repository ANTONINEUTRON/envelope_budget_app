import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'income.g.dart';
enum IncomeType{
  cash_in_hand, bank, wallet, card, others;
}

@JsonSerializable()
class Income extends Equatable{
  final String label;
  double balance;
  final IncomeType incomeType;

  Income({
    required this.label,
    required this.balance,
    required this.incomeType
  });

  @override
  List<Object> get props => [label, incomeType];

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);

  Map<String, dynamic> toJson(Income Income) => _$IncomeToJson(Income);
}