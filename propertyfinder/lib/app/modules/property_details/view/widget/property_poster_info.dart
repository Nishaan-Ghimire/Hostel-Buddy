import 'package:flutter/material.dart';

class PosterInfo extends StatefulWidget {
  const PosterInfo({super.key});

  @override
  State<PosterInfo> createState() => _PosterInfoState();
}

class _PosterInfoState extends State<PosterInfo> {
  @override
  Widget build(BuildContext context) {
    return    Column(children: [

Row(children: [

  SizedBox(width: 5,),

  Text('posted by ',style: TextStyle(

    fontWeight: FontWeight.bold,color: Colors.black

  ),),



    

],),

SizedBox(height: 5,),

Row(children: [SizedBox(width: 5,height: 5,),



    CircleAvatar(

backgroundImage: NetworkImage('https://th.bing.com/th/id/R.ffc2adcb86ed3f7689bb24df653691d3?rik=O0sub3JhL9x5Ew&pid=ImgRaw&r=0'),



    ),SizedBox(width: 5,),Text('Rock Avi',style: TextStyle(

    fontWeight: FontWeight.bold,color: Colors.orange,fontSize: 18

  )

    

    )

],),

Row(

  children: [

    SizedBox(width: 35,),

        Text('22 Nov 2023'),

  ],

),

],);
  }
}