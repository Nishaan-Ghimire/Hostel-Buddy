import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFlat extends StatelessWidget {
  const AddFlat({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(children: [
     
      
      SizedBox(height: 10,),
      
      Text('Enter colony name if any ?'),
      
      TextFormField(),
      
      Text('Enter city'),
      
      TextFormField(),
      
      Text('Enter location / strret  '),
      
      TextFormField(),
      
      Text('Enter cost per month'),
      
      
      
      TextFormField(),
      SizedBox(height: 5,),
      Text('Flat type'),
     DropdownButton(
      hint: Text(' select'),
      items: [
       DropdownMenuItem<String>(
                    child: Text('single room with kitchen inside it',overflow: TextOverflow.ellipsis,),
                    value: '2 room 1 room 1 kitchen ',
                  ),
     DropdownMenuItem<String>(
                    child: Text('1BK'),
                    value: ' Hotel',
                  ),
            DropdownMenuItem<String>(
                    child: Text('2BK'),
                    value: ' Hotel',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('3BK'),
                    value: ' Hotel',
                  ),      
     
                  DropdownMenuItem<String>(
                    child: Text('1 BHK'),
                    value: 'Single room',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('2BHK'),
                    value: 'flat',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('3BHK'),
                    value: ' Hotel',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('1BH'),
                    value: ' Hotel',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('2BH'),
                    value: ' Hotel',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('3BH'),
                    value: ' Hotel',
                  ),
     
                    DropdownMenuItem<String>(
                    child: Wrap(
                      children: [
                        Text('2 Room/hall (commercial use)',overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    value: ' Hotel',
                  ),
                  DropdownMenuItem<String>(
                    child: Wrap(
                      children: [
                        Text('3 Room/hall (commercial use)',overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    value: ' Hotel',
                  ),
                     DropdownMenuItem<String>(
                    child: Wrap(
                      children: [
                        Text('3 Room/hall (commercial use)',overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    value: ' Hotel',
                  ),
                     DropdownMenuItem<String>(
                    child: Wrap(
                      children: [
                        Text('4 Room/hall (commercial use)',overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    value: ' Hotel',
                  ),
                     DropdownMenuItem<String>(
                    child: Wrap(
                      children: [
                        Text('5 Room/hall (commercial use)',overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    value: ' Hotel',
                  ),
                     DropdownMenuItem<String>(
                    child: Wrap(
                      children: [
                        Text('6-8 Room/hall (commercial use)',overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    value: ' Hotel',
                  ),
                     DropdownMenuItem<String>(
                    child: Wrap(
                      children: [
                        Text('8 - 10 Room/hall (commercial use)',overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    value: ' Hotel',
                  ),
                    DropdownMenuItem<String>(
                    child: Wrap(children:[ Text('More than 10 Room /commercial use)',overflow: TextOverflow.ellipsis,)]),
                    value: ' Hotel',
                  ),
     
     ], onChanged: (v){}),
    Text('Water'),
DropdownButton(
  hint: Text('select'),
  items: [
    DropdownMenuItem<String>(
                    child: Text('24 / 7'),
                    value: ' Hotel',
                  ),
                      DropdownMenuItem<String>(
                    child: Text('Need to collect '),
                    value: ' Hotel',
                  )
], onChanged: (v){

}),

    Text('Parking'),
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
                  )
], onChanged: (v){

}),

    Text('Bathroom'),

DropdownButton(
  hint: Text('select'),
  items: [
    DropdownMenuItem<String>(
                    child: Text('Separate'),
                    value: ' Hotel',
                  ),
                      DropdownMenuItem<String>(
                    child: Text('Common'),
                    value: ' Hotel',
                  ),
                DropdownMenuItem<String>(
                    child: Text('Attach'),
                    value: ' Hotel',
                  ),      
], onChanged: (v){

}),


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