import 'package:flutter/material.dart';
import 'dial_pad_screen.dart';
import 'call_history_screen.dart';
import 'contacts_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  HomeScreen({required this.isDarkMode, required this.toggleTheme});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          DialPadScreen(isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme),
          CallHistoryScreen(isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme),
          ContactsScreen(isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
        selectedItemColor: widget.isDarkMode ? Colors.white : Colors.deepPurpleAccent,
        unselectedItemColor: widget.isDarkMode ? Colors.grey : Colors.black54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dialpad), label: "Dial"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "Contacts"),
        ],
      ),
    );
  }
}
