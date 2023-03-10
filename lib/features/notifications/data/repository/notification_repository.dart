
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/notification.dart';

class NotificationRepository{
  String _NotificationsKey = "Notification Key";

  Future<void> addNotification(Notification notification)async {
    var sp = await SharedPreferences.getInstance();
    //get notification list
    List<Notification> nL = await getNotifications();
    //add notification to list
    nL.add(notification);
    //save list
    _saveNotifications(NotificationList(notifications: nL));
  }

  Future<void> removeNotification(Notification notification) async {
    var sp = await SharedPreferences.getInstance();
    //get notification list
    List<Notification> nL = await getNotifications();
    //remove notification to list
    nL.remove(notification);
    //save list
    _saveNotifications(NotificationList(notifications: nL));
  }

  Future<void> clearNotification()async {
    var sp = await SharedPreferences.getInstance();
    sp.setString(_NotificationsKey, "");
  }

  Future<List<Notification>> getNotifications() async{
    //ACCESS sharedpref and get list
    var sp = await SharedPreferences.getInstance();
    var listAsStr = sp.getString(_NotificationsKey) ?? "";
    //if not empty convert list to object
    if(listAsStr.isEmpty) return [];
    NotificationList nL = NotificationList.fromJson(jsonDecode(listAsStr));
    //return value
    return nL.notifications;
  }

  Future<void> _saveNotifications(NotificationList notificationList)async{
    var sp = await SharedPreferences.getInstance();
    print("SAVE NOTIFICATION CALLED");
    sp.setString(_NotificationsKey, jsonEncode(notificationList.toJson()));
  }
}
