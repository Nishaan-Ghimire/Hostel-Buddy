import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWidget extends StatefulWidget {
  var name,city,facilities,rent,photo;
  //const
   SearchWidget({required this.name,required this.city,required this.facilities,required this.rent,required this.photo});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
   padding: const EdgeInsets.all(8.0),
   child: Container(height: 140
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
      Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          image: DecorationImage(image: NetworkImage(widget.photo
          
          ),fit: BoxFit.cover)
        ),
          height: 138
          
          //118
          
          ,width: 110,
          //child: Image.network('https://epicpetclub.com/wp-content/uploads/2021/04/imag-of-flat-apartment.jpg',
         //fit: BoxFit.fill,
          //height: 98,width:150,
          //)
          ),
      ),
    
      Padding(
        padding: const EdgeInsets.only(bottom:50.0,left: 10),
        child: Column(
          children: [
          //  SizedBox(height: 2,),
            Text('${widget.name} ',style: TextStyle(fontSize: 14,color: Colors.orange,fontWeight: FontWeight.bold),),
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${widget.city}'),
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
            Text('Rs ${widget.rent} /month',style: TextStyle(
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