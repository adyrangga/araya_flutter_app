import 'package:araya_flutter_app/api/apiLoginMenu.dart';
import 'package:araya_flutter_app/screens/dashboard.dart';
import 'package:araya_flutter_app/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyStatefulWidget(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyStatefulWidget(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  LoginRoute createState() => LoginRoute();
}

class LoginRoute extends State<MyStatefulWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void _openDrawer() {
    print('_openDrawer');
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeDrawer() {
    print('_openDrawer');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: _openDrawer,
              color: Colors.black,
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'GNC',
                style: TextStyle(color: Colors.red, fontSize: 30, letterSpacing: 0),
                textAlign: TextAlign.center,
              ),
              Text(
                'Live Well',
                style: TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: LoginScreen(),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              RaisedButton(
                onPressed: _closeDrawer,
                child: const Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ),
      // Disable opening the drawer with a swipe gesture.
      drawerEdgeDragWidth: 0,
    );
  }
}
