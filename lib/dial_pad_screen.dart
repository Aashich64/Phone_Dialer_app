import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DialPadScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  DialPadScreen({required this.isDarkMode, required this.toggleTheme});

  @override
  _DialPadScreenState createState() => _DialPadScreenState();
}

class _DialPadScreenState extends State<DialPadScreen> {
  String phoneNumber = "";

  void addDigit(String digit) {
    setState(() {
      phoneNumber += digit;
    });
  }

  void deleteDigit() {
    if (phoneNumber.isNotEmpty) {
      setState(() {
        phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
      });
    }
  }

  void makeCall() async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch dialer')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Dial Pad"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6, color: widget.isDarkMode ? Colors.white : Colors.black),
            onPressed: () => widget.toggleTheme(),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Text(
              phoneNumber,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          SizedBox(height: 70),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.3,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                List<String> buttons = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.isDarkMode ? Colors.grey[850] : Colors.grey[300],
                  ),
                  onPressed: () => addDigit(buttons[index]),
                  child: Text(
                    buttons[index],
                    style: TextStyle(
                      fontSize: 28,
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.backspace, size: 32, color: widget.isDarkMode ? Colors.white : Colors.black),
                onPressed: deleteDigit,
              ),
              SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: makeCall,
                child: Icon(Icons.call, color: Colors.white, size: 32),
              ),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}