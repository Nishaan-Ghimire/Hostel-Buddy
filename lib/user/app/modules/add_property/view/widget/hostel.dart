import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHostel extends StatelessWidget {
  const AddHostel({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
     
      
      SizedBox(height: 10,),
      
      Text('Enter  hostel name'),
      
      Container(
        height: 30,
        child: TextFormField()),
      Text('Hostel type'),
      DropdownButton(
        hint: Text('select'),
        items: [
          DropdownMenuItem<String>(
                    child: Text('Boys hostel'),
                    value: ' Hotel',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Girls hostel'),
                    value: ' Hotel',
                  ),
      ], onChanged: (v){}),

         Text('parking'),
      DropdownButton(
        hint: Text('select'),
        items: [
          DropdownMenuItem<String>(
                    child: Text('yes'),
                    value: ' Hotel',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('no'),
                    value: ' Hotel',
                  ),
      ], onChanged: (v){}),
         Text('water'),
      DropdownButton(
        hint: Text('select'),
        items: [
          DropdownMenuItem<String>(
                    child: Text('24 / 7'),
                    value: ' Hotel',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Need to collect'),
                    value: ' Hotel',
                  ),
                  
      ], onChanged: (v){}),
      Text('wifi'),
     DropdownButton(
      hint: Text('select'),
      items: [
      DropdownMenuItem<String>(
                    child: Text('yes'),
                    value: ' Hotel',
                  ),
                   DropdownMenuItem<String>(
                    child: Text('no'),
                    value: ' Hotel',
                  ),
     ], onChanged: (v){

     }),
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