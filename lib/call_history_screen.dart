import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import 'package:permission_handler/permission_handler.dart';

class CallHistoryScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  CallHistoryScreen({required this.isDarkMode, required this.toggleTheme});

  @override
  _CallHistoryScreenState createState() => _CallHistoryScreenState();
}

class _CallHistoryScreenState extends State<CallHistoryScreen> {
  List<CallLogEntry> callLogs = [];

  @override
  void initState() {
    super.initState();
    fetchCallLogs();
  }

  Future<void> fetchCallLogs() async {
    if (await Permission.phone.request().isGranted) {
      Iterable<CallLogEntry> entries = await CallLog.get();
      setState(() {
        callLogs = entries.toList();
      });
    } else {
      print("Permission Denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Call History"),
       // backgroundColor: widget.isDarkMode ? Colors.black : Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: fetchCallLogs,
          ),
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => widget.toggleTheme(),
          ),
        ],
      ),
     // backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      body: callLogs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: callLogs.length,
        itemBuilder: (context, index) {
          final log = callLogs[index];
          return ListTile(
            leading: Icon(
              log.callType == CallType.incoming
                  ? Icons.call_received
                  : log.callType == CallType.outgoing
                  ? Icons.call_made
                  : Icons.call_missed,
              color: widget.isDarkMode ? Colors.white : Colors.deepPurpleAccent,
            ),
            title: Text(
              log.name ?? log.number ?? "Unknown",
              style: TextStyle(
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            subtitle: Text(
              "${log.callType.toString().split('.').last} - ${DateTime.fromMillisecondsSinceEpoch(log.timestamp!)}",
              style: TextStyle(
                color: widget.isDarkMode ? Colors.grey : Colors.black54,
              ),
            ),
            trailing: Text(
              "${log.duration} sec",
              style: TextStyle(
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}