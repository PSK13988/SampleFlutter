import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClickMe extends StatefulWidget {
  const ClickMe({Key? key}) : super(key: key);

  @override
  State<ClickMe> createState() => _ClickMeState();
}

class _ClickMeState extends State<ClickMe> {
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(context: context, initialDate: currentDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Click Me page'),
      ),
      body: Column(
        children: [
          // Image.asset('images/Rewire-logo.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              'Republic Day is a public holiday in India, when the country marks and celebrates the date on which the Constitution of India came into effect on 26 January 1950,',
              style: TextStyle(fontSize: 20),
              showCursor: true,
              toolbarOptions: ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Edit'),
                          ),
                          ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Delete'),
                          )
                        ],
                      );
                    });
              },
              child: Text('Click me')),
          SizedBox(
            height: 100,
          ),
          Text(
            currentDate.toString(),
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select date'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
