import 'package:flutter/material.dart';
import 'package:world_time/classes/world-time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(city: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(city: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(city: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(city: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(city: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(city: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(city: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(city: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(city: 'Asia/Manila', location: 'Manila', flag: 'philippines.png'),
  ];

  void updateTime(index) async {
    WorldTime selectedCountry = locations[index];
    await selectedCountry.getTime();
    Navigator.pop(context, {
      'location': selectedCountry.location,
      'flag': selectedCountry.flag,
      'time': selectedCountry.time,
      'isDaytime': selectedCountry.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text('Choose a Location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
