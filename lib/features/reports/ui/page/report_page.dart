import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7,right: 7),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
        slivers: [
          SliverAppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total balance"),
                Text("#2000")
              ],
            ),
            expandedHeight: 200,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: Text("1"),
                      )
                    ],
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment.center,
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 4,
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Recent Transactions",
                    style: GoogleFonts.averageSans(
                      textStyle: Theme.of(context).textTheme.headline6
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                          "see all",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  )
                ],
              ),
            ),
          ),

          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 5,
                (context, index){
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text("$index"),
                    ),
                  );
                }
              )
          )
        ],
      ),
    );
  }
}
