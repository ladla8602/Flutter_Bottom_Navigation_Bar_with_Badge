import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Demo',
      home: MyHomePage(title: 'Bottom Navigation Bar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Note curly braces on function parameter means they are optional
  Widget _buildNavIcon(IconData icon, int index, {int badge = 0}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kBottomNavigationBarHeight,
      child: Material(
        color: Colors.blue,
        child: InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                // Here is the main works start
                child: Container(
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 22,
                      ),
                      index != 0
                          ? Positioned(
                              right: -15.0,
                              top: -15.0,
                              child: Container(
                                height: 24,
                                width: 24,
                                constraints: BoxConstraints(
                                  maxHeight: 45,
                                  maxWidth: 45,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.yellowAccent,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text("$badge"),
                                ),
                              ),
                            )
                          : Container(
                              child: SizedBox.shrink(),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Boottom Naviagtion Bar with custom badge',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed, // this is important if you want
        //more then 3 icon in navigation
        iconSize: 24.0,
        items: [
          BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.home, 0),
              title: SizedBox.shrink() // This is also option
              ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.calendar_today, 1, badge: 4),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.comment, 2, badge: 3),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.settings, 3, badge: 2),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(Icons.person, 4),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
