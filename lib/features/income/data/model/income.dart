import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'income.g.dart';
enum IncomeType{
  cash_in_hand, bank, wallet, card, others;
}

Map<IncomeType,IconData> mapOfIconsToIncomeTypes = {
  IncomeType.bank : FontAwesomeIcons.buildingColumns,
  IncomeType.cash_in_hand : FontAwesomeIcons.moneyBill,
  IncomeType.card : FontAwesomeIcons.creditCard,
  IncomeType.wallet : FontAwesomeIcons.wallet,
  IncomeType.others : FontAwesomeIcons.ellipsis
};


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

  Map<String, dynamic> toJson() => _$IncomeToJson(this);
}