
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'card.g.dart';

@JsonSerializable()
class CCard extends Equatable{
  const CCard({
    required this.name,
    required this.number,
    required this.provider,
    required this.cvv,
    required this.expiryDate
  });

  final String name;
  final String number;
  final String provider;
  final String cvv;
  final String expiryDate;

  @override
  List<Object?> get props => [provider, number, cvv];

  factory CCard.fromJson(Map<String, dynamic> json) => _$CCardFromJson(json);

  Map<String, dynamic> toJson() => _$CCardToJson(this);
}