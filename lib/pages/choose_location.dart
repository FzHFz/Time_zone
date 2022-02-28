import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'saudi.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/${locations[index].flag}') ,
                    ),
                ),
            ),
          );
        },
      ),
    );
  }
}
