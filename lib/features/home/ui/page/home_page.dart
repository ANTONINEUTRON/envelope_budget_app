import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../accounts/ui/pages/account_page.dart';
import '../../../budgets/ui/page/budgets_page.dart';
import '../../../notifications/ui/page/notification_page.dart';
import '../../../reports/ui/page/report_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            ReportPage(),
            BudgetsPage(),
            AccountPage(),
            NotificationPage()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected:(index){
          _pageController.jumpToPage(index);
          setState(()=>index = _currentIndex);
        },
        items: _getNavItems(),
      ),
    );
  }

  List<BottomNavyBarItem> _getNavItems() {
    return [
        BottomNavyBarItem(
          icon: const Icon(Icons.pie_chart),
          title: const Text("Reports")
        ),
        BottomNavyBarItem(
            icon: const FaIcon(FontAwesomeIcons.envelope),
            title: const Text("Budgets")
        ),
        BottomNavyBarItem(
          icon: const FaIcon(FontAwesomeIcons.buildingColumns),
          title: const Text("Accounts")
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.notifications),
          title: const Text("Notifications")
        )
      ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
}
