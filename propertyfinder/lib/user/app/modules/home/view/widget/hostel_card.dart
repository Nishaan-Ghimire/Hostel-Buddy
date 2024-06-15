import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propertyfinder/user/app/data/hostel_model.dart';

class HostelCard extends StatelessWidget {
  HostelModel hostels;
  var isSmall;
   HostelCard({required this.hostels,this.isSmall=false});

  @override
  Widget build(BuildContext context) {
    return 
    
  //  ConstrainedBox(
  //    constraints: BoxConstraints(
  //             minWidth: 100,
  //          minHeight: 30,
           
  //         // 150,
  //         maxWidth: 200,
  //         maxHeight:40
  //         //isSmall==true?90: 450,
              
  //            ),
  //              child: 
                
                
                Container(
                  height:isSmall?150: 260,
               //color: Colors.red,
                  child: Column(
                    children: [
                        Container(
                          height:
                   isSmall?     60:120,
width: 140,
                        // 130,
                         // height:130 ,
                    //  height:isSmall==true?70: 126,
                    //  width:isSmall==true?160: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        hostels.image!,
                       fit: BoxFit.fitWidth,
                     //   height: 50,
                        //height: 130,
                      ),
                    ),
                  
                     Expanded(child: Text(hostels.name!)),
                      Expanded(child: Text(hostels.location!)),
                      Expanded(child: Text('Rs ${hostels.price!} /month')),
                      Expanded(child: Text(hostels.isAvailable=='true'?'Available':'Not Available',style: TextStyle(color:hostels.isAvailable=='true'?
                       Colors.green:Colors.red),)),
                     // Expanded(child: Text('${hostels.floor} / ${hostels.noOfBeds}')
                    //  ),
                   //  Text()
                    ],
                  ),
                );
                //,
            //  );
  }
}