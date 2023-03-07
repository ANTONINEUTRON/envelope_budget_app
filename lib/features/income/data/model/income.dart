import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'income.g.dart';
enum CardProvider{
  visa, mastercard, verve;
}

Map<CardProvider,IconData> mapOfIconsToIncomeTypes = {
  CardProvider.visa : FontAwesomeIcons.ccVisa,
  CardProvider.mastercard : FontAwesomeIcons.ccMastercard,
  CardProvider.verve : FontAwesomeIcons.creditCard,
};


@JsonSerializable()
class Income extends Equatable{
  final String label;
  double balance;
  final CardProvider incomeType;

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