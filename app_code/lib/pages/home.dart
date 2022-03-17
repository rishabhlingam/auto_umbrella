import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[800],
        title: Text("Auto - Umbrella", style: TextStyle( fontSize: 25.0 ),),
        centerTitle: false,
        actions: <Widget>[
          // Using Stack to show Notification Badge
          new Stack(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.notifications, size: 30.0,),
                  onPressed: () {
                setState(() {
                  counter = 0;
                });
              }),
              counter != 0 ? new Positioned(
                right: 11,
                top: 11,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ) : new Container()
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/flora-2.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Opacity(
          opacity: 0.8,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                color: Colors.teal[100],
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Humidity', style: TextStyle(fontSize: 23.0, letterSpacing: 2.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      Icon(
                        Icons.bubble_chart_outlined,
                        size: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.teal[200],
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Temperature', style: TextStyle(fontSize: 23.0, letterSpacing: 2.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      Icon(
                        Icons.device_thermostat_rounded,
                        size: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.teal[300],
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Battery %', style: TextStyle(fontSize: 23.0, letterSpacing: 2.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      Icon(
                        Icons.battery_charging_full_rounded,
                        size: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.teal[400],
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children : <Widget>[
                    Text('Flap', style: TextStyle(fontSize: 23.0, letterSpacing: 2.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ],
              ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen[700],
        onPressed: () {
        print("Increment Counter");
        setState(() {
          counter++;
        });
      }, child: Icon(Icons.add),),
    );
  }
}

/*
const SizedBox(
width: 300,
height: 100,
child: Text('Humidity', style: TextStyle(fontSize: 23.0, letterSpacing: 2.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
),
 */

