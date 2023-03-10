// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      message: json['message'] as String,
      time: DateTime.parse(json['time'] as String),
      notificationType:
          $enumDecode(_$NotificationTypeEnumMap, json['notificationType']),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'message': instance.message,
      'time': instance.time.toIso8601String(),
      'notificationType': _$NotificationTypeEnumMap[instance.notificationType]!,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.warning: 'warning',
  NotificationType.tipsAndHint: 'tipsAndHint',
  NotificationType.normal: 'normal',
};

NotificationList _$NotificationListFromJson(Map<String, dynamic> json) =>
    NotificationList(
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationListToJson(NotificationList instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
    };
