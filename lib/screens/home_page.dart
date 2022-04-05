import 'package:flutter/material.dart';
import 'package:sample_2/screens/user_profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'HOME PAGE',
        )),
      ),
      body: const MyCustomForm(),
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 215,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.white70, Colors.white70]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'images/Rewire-logo.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const Text(
                      'Jagruti',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: 17.0,
                      ),
                    ),
                    const Text(
                      'mahajanjagruti09@gmail.com',
                      maxLines: 2,
                      style: TextStyle(letterSpacing: 1.0, color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle_outlined,
                color: Colors.red,
              ),
              title: const Text('User Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserProfile()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.apartment,
                color: Colors.red,
              ),
              title: const Text('Company Profile'),
              onTap: () {
                //Navigator.pop(context);
                //AppRoutes.push(context, const CompanyRegisterScreen());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.widgets_outlined,
                color: Colors.red,
              ),
              title: const Text('Masters Data'),
              onTap: () {
                //Navigator.pop(context);
                // AppRoutes.push(context, const MasterDataScreen());
              },
            ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.list_alt,
            //     color: AppConstants.colorPrimary,
            //   ),
            //   title: const Text('Reports'),
            //   onTap: () {
            //     Utility.showInfo(message: 'In progress');
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                color: Colors.red,
              ),
              title: const Text('Settings'),
              onTap: () {
                // Navigator.pop(context);
                //AppRoutes.push(context, const SettingScreen());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.handyman_outlined,
                color: Colors.red,
              ),
              title: const Text('Terms and Conditions'),
              onTap: () {
                // Navigator.pop(context);
                //  AppRoutes.push(context, const TermsAndConditionScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Enter your name',
              // TODO: add errorHint
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              labelText: 'Enter your name',
              // TODO: add errorHint
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
