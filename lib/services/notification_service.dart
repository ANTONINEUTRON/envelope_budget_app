
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/notifications/data/model/notification.dart' as NotiModel;
import '../features/notifications/ui/bloc/notification_bloc.dart';

class NotificationService{
  NotificationService({required this.context});

  final BuildContext context;

  void sendMessage(String msg, NotiModel.NotificationType notificationType){
    context.read<NotificationBloc>().addNotification(
      NotiModel.Notification(
          message: msg,
          time: DateTime.now(),
          notificationType: notificationType
      )
    );
  }
}