import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'account.g.dart';
enum AccountType{
  bank, card, others;
}

@JsonSerializable()
class Account extends Equatable{
  final String label;
  double balance;
  final AccountType accountType;

  Account({
    required this.label,
    required this.balance,
    required this.accountType
  });

  @override
  List<Object> get props => [label, accountType];

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson(Account account) => _$AccountToJson(account);
}