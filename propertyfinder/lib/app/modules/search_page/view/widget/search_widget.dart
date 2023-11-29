import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
   padding: const EdgeInsets.all(8.0),
   child: Container(height: 120
   ,width: Get.width/1.5,
   decoration: BoxDecoration(
//color: Colors.red,
border: Border.all(color: Colors.black),
borderRadius: BorderRadius.circular(35),boxShadow: [

]
   ),
   child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Row(children: [
      //Text('data'),
      Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: NetworkImage('https://epicpetclub.com/wp-content/uploads/2021/04/imag-of-flat-apartment.jpg',
        
        ),fit: BoxFit.cover)
      ),
        height: 118,width: 110,
        //child: Image.network('https://epicpetclub.com/wp-content/uploads/2021/04/imag-of-flat-apartment.jpg',
       //fit: BoxFit.fill,
        //height: 98,width:150,
        //)
        ),
    
      Padding(
        padding: const EdgeInsets.only(bottom:50.0,left: 10),
        child: Column(
          children: [
          //  SizedBox(height: 2,),
            Text('2 BHK Flat ',style: TextStyle(fontSize: 14,color: Colors.orange,fontWeight: FontWeight.bold),),
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Koteswor Kathmandu'),
                SizedBox(width: 10,),
               
              ],
            ),
Wrap(runSpacing: 15,spacing:
10,
// 4,
  children: [
        Container(height: 20,
    
    //width: 100,
    
    decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(6)),
    
    child: Center(child: Padding(
    
      padding: const EdgeInsets.all(1.0),
    
      child:   Text('Attach bathroom'),
    
    ),),
    
    //color: Colors.grey,
    
    ),
            Container(height: 20,
    
    //width: 100,
    
    decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(6)),
    
    child: Center(child: Padding(
    
      padding: const EdgeInsets.all(1.0),
    
      child:   Text('parking '),
    
    ),),
    
    //color: Colors.grey,
    
    ),
  ],
),
//SizedBox(height: 5,),
            Text('Rs 20 k / month',style: TextStyle(
              color: Colors.red,
              //fontSize: 18
            ),),

          //   Text('Rs 12000 / month')
          ],
        ),
      )
    
    ],),
   // Text('data')
   ],),
   ),
 );
  }
}