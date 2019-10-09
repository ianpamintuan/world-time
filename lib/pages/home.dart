import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String bgImage;
  Color bgColor;

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                dynamic selectedCountry = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'location': selectedCountry['location'],
                    'flag': selectedCountry['flag'],
                    'time': selectedCountry['time'],
                    'isDaytime': selectedCountry['isDaytime']
                  };
                });
              },
              icon: Icon(
                Icons.edit_location,
                color: Colors.grey[300],
              ),
              label: Text(
                'Edit Location',
                style: TextStyle(
                  color: Colors.grey[300],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data['location'],
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data['time'],
                  style: TextStyle(
                    fontSize: 60,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
