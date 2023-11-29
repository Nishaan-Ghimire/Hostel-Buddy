import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHotel extends StatelessWidget {
  const AddHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(children: [
     
      
      SizedBox(height: 10,),
      
      Text('Enter name of hostel / flat / property'),
      
      TextFormField(),
      
      Text('Enter city'),
      
      TextFormField(),
      
      Text('Enter location '),
      
      TextFormField(),
      
      Text('Enter cost per month'),
      
      
      
      TextFormField(),
     
    

Text('Enter mobile no'),
      
      
      
      TextFormField(),
       Text('Upload Photos'),
  Container(
        height: 50,
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.add))),
      
      ElevatedButton(onPressed: (){
        
      }, child: Center(child: Text('Submit'),),
      
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
      
      )
      
      ],);
  }
}