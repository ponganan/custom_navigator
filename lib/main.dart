import 'package:flutter/material.dart';
import 'mail_page.dart';

void main() {
  runApp(
    const MainPage(),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screen = const [
    MailPage(),
    Center(
      child: Text(
        'Chat',
        style: TextStyle(fontSize: 70),
      ),
    ),
    Center(
      child: Text(
        'Spaces',
        style: TextStyle(fontSize: 70),
      ),
    ),
    Center(
      child: Text(
        'Meet',
        style: TextStyle(fontSize: 70),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screen[index],
        //warp NavigationBarTheme to NavigationBar
        // for config color and Text at navigation bar
        //if NavigationBarTheme got Error
        // switch to terminal and use this command
        // -> flutter channel master
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade200,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            height: 90,
            backgroundColor: const Color(0xFFA6F415),
            //use to show/hide Icon name
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            //use to slow animation
            animationDuration: const Duration(seconds: 1),
            selectedIndex: index,
            //-----------use for get select bar from user
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            // ----------
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.mail_outline),
                selectedIcon: Icon(Icons.mail),
                label: ('Mail'),
              ),
              NavigationDestination(
                icon: Icon(Icons.chat_bubble_outline),
                selectedIcon: Icon(Icons.chat_bubble),
                label: ('Chat'),
              ),
              NavigationDestination(
                icon: Icon(Icons.group_outlined),
                selectedIcon: Icon(Icons.group),
                label: ('Spaces'),
              ),
              NavigationDestination(
                icon: Icon(Icons.videocam_outlined, size: 50),
                selectedIcon: Icon(Icons.videocam, size: 50),
                label: ('Meet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
