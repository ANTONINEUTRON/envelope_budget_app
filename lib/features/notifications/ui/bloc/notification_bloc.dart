import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/notification.dart';
import '../../data/repository/notification_repository.dart';

class NotificationBloc extends Cubit<List<Notification>>{
  NotificationBloc()
      : super([]){
    _notifyState();
  }

  NotificationRepository nR = NotificationRepository();

  Future<void> addNotification(Notification notification)async{
    await nR.addNotification(notification);
    _notifyState();
  }

  Future<void> clearNotification()async{
    await nR.clearNotification();
    _notifyState();
  }

  Future<void> removeNotification(Notification notification)async{
    await nR.removeNotification(notification);
    _notifyState();
  }

  Future<void> _notifyState() async => emit(await nR.getNotifications());
}