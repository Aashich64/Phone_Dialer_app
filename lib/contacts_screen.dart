import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactsScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  ContactsScreen({required this.isDarkMode, required this.toggleTheme});

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    Iterable<Contact> contactList = await ContactsService.getContacts();
    setState(() {
      contacts = contactList.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Contacts"),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => widget.toggleTheme(),
          ),
        ],
      ),
      body: contacts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: Icon(Icons.person, color: widget.isDarkMode ? Colors.white : Colors.deepPurpleAccent),
            title: Text(
              contact.displayName ?? "Unknown",
              style: TextStyle(
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            subtitle: Text(
              (contact.phones != null && contact.phones!.isNotEmpty)
                  ? contact.phones!.first.value ?? "No number"
                  : "No number", // Prevents "Bad state: No element" error
              style: TextStyle(
                color: widget.isDarkMode ? Colors.grey : Colors.black54,
              ),
            ),
          );
        },
      ),
    );
  }
}
