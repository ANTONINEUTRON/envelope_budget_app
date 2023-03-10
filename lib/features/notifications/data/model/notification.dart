import 'package:envelope_budget_app/features/notifications/data/repository/notification_repository.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'notification.g.dart';

enum NotificationType{
  warning, tipsAndHint,normal
}

@JsonSerializable()
class Notification extends Equatable{
  const Notification({required this.message, required this.time, required this.notificationType});
  final String message;
  final DateTime time;
  final NotificationType notificationType;

  @override
  // TODO: implement props
  List<Object?> get props => [message, time.toString()];

  factory Notification.fromJson(Map<String, dynamic> json)
      => _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}

@JsonSerializable()
class NotificationList{
  NotificationList({required this.notifications});
  final List<Notification> notifications;

  factory NotificationList.fromJson(Map<String, dynamic> json)
      => _$NotificationListFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationListToJson(this);
}