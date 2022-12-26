import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
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
                                "Message to be shown to the user on activities gogoojdknd asnkd sknc sdj nskl",
                                style: GoogleFonts.dmSans(
                                  textStyle: Theme.of(context).textTheme.labelLarge,
                                  fontSize: 15
                                ),
                              ),
                              Text(
                                "Dec 20th, 2017"
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
      ),
    );
  }
}
