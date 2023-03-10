import 'package:envelope_budget_app/features/notifications/ui/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/helpers_functions.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    var listOfNotifications = context.watch<NotificationBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        actions: [
          IconButton(
              onPressed: (){
                context.read<NotificationBloc>().clearNotification();
              },
              icon: Icon(Icons.cancel_outlined)
          )
        ],
      ),
      body: listOfNotifications.isNotEmpty
          ? ListView.builder(
            itemCount: listOfNotifications.length,
            itemBuilder: (context, index){
              return NotificationUI(
                date:  listOfNotifications[index].time,
                message: listOfNotifications[index].message,
              );
            }
        ) : Center(
          child: Text("No Notification Found",),
        ),
    );
  }
}

class NotificationUI extends StatelessWidget {
  const NotificationUI({
    Key? key,
    required this.message,
    required this.date,
  }) : super(key: key);

  final String message;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 3),
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$message",
                        style: GoogleFonts.dmSans(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          fontSize: 15
                        ),
                      ),
                      Text(
                          formatDate(date),
                          style: GoogleFonts.acme()
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
