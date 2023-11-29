import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderOption extends StatelessWidget {
  const HeaderOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 58,child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
  Column(
    children: [
      CircleAvatar(
        child: Icon(Icons.house),
      ),
      Text('Room')
    ],
  ),Column(
    children: [
      CircleAvatar(
 child: Icon(Icons.hotel),
        
      ),
      Text('Hostel')
    ],
  ),Column(
    children: [
      CircleAvatar(
 child: Icon(CupertinoIcons.building_2_fill),
       
      ),Text('Hotel')
    ],
  ),Column(
    children: [
      CircleAvatar(
 child: Icon(CupertinoIcons.music_house),
      ),Text('Property')
    ],
  )
],),);
  }
}