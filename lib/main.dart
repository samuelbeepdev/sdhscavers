import 'package:flutter/material.dart';
import 'package:sdhscavers/views/account.dart';
import 'package:sdhscavers/views/clubs.dart';
import 'package:sdhscavers/views/handbook.dart';
import 'package:sdhscavers/views/home.dart';
import 'package:sdhscavers/views/safety.dart';

void main() {
  runApp(const SDHSApp());
}

class SDHSApp extends StatefulWidget {
  const SDHSApp({Key? key}) : super(key: key);

  @override
  State<SDHSApp> createState() => _SDHSAppState();
}

class _SDHSAppState extends State<SDHSApp> {
  int _selectedPage = 0;
  final List<String> _pageTitles = ["San Diego High", "Activities", "Account", "Handbook", "Safety"];
  final List<Widget> _pageContent = const [
    SDHSAppHome(),
    SDHSAppClubs(),
    SDHSAppAccount(),
    SDHSAppHandbook(),
    SDHSAppSafety(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_pageTitles[_selectedPage]),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_month), tooltip: "Schedule"),
            IconButton(onPressed: () {}, icon: const Icon(Icons.map), tooltip: "Map"),
            IconButton(onPressed: () {}, icon: const Icon(Icons.info), tooltip: "About"),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: "Student ID",
            child: const Icon(Icons.credit_card)),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedPage,
          onDestinationSelected: (i) => setState(() {
            _selectedPage = i;
          }),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.group), label: "Activities"),
            NavigationDestination(icon: Icon(Icons.person), label: "Me"),
            NavigationDestination(icon: Icon(Icons.book), label: "Handbook"),
            NavigationDestination(
                icon: Icon(Icons.health_and_safety), label: "Safety"),
          ],
        ),
      ),
    );
  }
}
