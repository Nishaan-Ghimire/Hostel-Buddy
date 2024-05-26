import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propertyfinder/user/app/data/hostel_model.dart';

class HostelCard extends StatelessWidget {
  HostelModel hostels;
  var isSmall;
   HostelCard({required this.hostels,this.isSmall=false});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
               minWidth: 100,
           minHeight: 150,
           maxWidth: 200,
           maxHeight:isSmall==true?150: 450,
              
              ),
                child: Column(
                  children: [
                      Container(
                    height:isSmall==true?70: 126,
                    width:isSmall==true?160: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      hostels.image,
                      fit: BoxFit.cover,height: 130,
                    ),
                  ),
                
                   Text(hostels.name),
                   Text(hostels.location),
                   Text(hostels.price),
                   Text(hostels.isAvailable,style: TextStyle(color: Colors.green),),
                   Text('${hostels.floor} / ${hostels.noOfBeds}'),
                 //  Text()
                  ],
                ),
              );
  }
}