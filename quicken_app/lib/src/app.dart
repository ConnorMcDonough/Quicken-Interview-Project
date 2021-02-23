import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quicken_app/src/data_models/user_model.dart';
import 'package:quicken_app/src/screens/login_screen.dart';

Future _initHive() async {
  var pathProvider = await getApplicationDocumentsDirectory();
  Hive.init(pathProvider.path);
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      print("Hive adpter started!");
      Hive.registerAdapter(UserModelAdapter());
    } on Error {
      print("Hive register adapter updated");
    }

    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quicken Homework Project",
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
      home: FutureBuilder(
        future: _initHive(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              print(snapshot.error);
              return Scaffold(
                body: Center(
                  child: Text('Error initializing hive data store.'),
                ),
              );
            } else {
              return LoginScreen();
            }
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }),
    );
  }
}
