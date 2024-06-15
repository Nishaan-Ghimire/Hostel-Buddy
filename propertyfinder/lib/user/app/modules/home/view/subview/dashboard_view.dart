import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/data/hostel_model.dart';
import 'package:propertyfinder/user/app/data/repo/auth_repo.dart';
import 'package:propertyfinder/user/app/routes/app_routes.dart';
import 'package:propertyfinder/vendor/app/modules/add_property/view/add_property.dart';
import 'package:propertyfinder/user/app/modules/home/controller/home_controller.dart';
import 'package:propertyfinder/user/app/modules/home/view/widget/headeroptions.dart';
import 'package:propertyfinder/user/app/modules/home/view/widget/hostel_card.dart';
import 'package:propertyfinder/user/app/modules/property_details/view/property_view.dart';
import 'package:propertyfinder/user/app/modules/search_page/view/search_view.dart';
import 'package:propertyfinder/vendor/app/modules/home/vendor_home_view.dart';

List<String> img=[
  'https://th.bing.com/th/id/R.caa94be83ec7ee9e2740a0ba2b1107c4?rik=KWs7OOSB2jR8xA&riu=http%3a%2f%2fwww.godsavethepoints.com%2fwp-content%2fuploads%2f2018%2f07%2fhostel.jpg&ehk=N73OpLFzxMXYjLB7JE7QYE2jfq6OVgXbne4hqmyV0yg%3d&risl=&pid=ImgRaw&r=0',
  'https://th.bing.com/th/id/OIP.tEicCQvnLrfsrspl1oqYrgHaE8?pid=ImgDet&rs=1',
  'https://th.bing.com/th/id/OIP.ltb2e-lU_WMYbfxO6JO9ZgHaFJ?pid=ImgDet&rs=1'
];
List<HostelModel> hostel=[
  HostelModel('Xavier Boys Hostel', 'https://th.bing.com/th/id/OIP.6FXFgDcYyXiGeIYxBBqu8wHaE8?pid=ImgDet&rs=1', 'Koteswor ,Kathmandu', 'Available', '12 k /month','',''),
   HostelModel('Saint marry Girls hostel', 'https://th.bing.com/th/id/OIP.n4IqztpUrpZf8l_Dy_S2UgHaE7?pid=ImgDet&rs=1', 'Tinkune ,Kathmandu','Available', '10 k /month','',''),
    HostelModel('Kathmandu boys hostel', 'https://i.pinimg.com/originals/3e/a2/cc/3ea2ccaa73cb6d6e56c560178b957353.png', 'Baneswor ,Kathmandu','Available', '10 k /month','',''),
     HostelModel('Lovely Girls Hostel', 'https://pix3.agoda.net/hotelimages/211/2112415/2112415_17032507130051839886.jpg', 'Koteswor ,Kathmandu','Available', '11 k /month','',''),
      HostelModel('ABC Boys Hostel', 'https://pix10.agoda.net/hotelImages/343464/-1/1ccdc7a63f5c0d68e9fdf3dff8f1a230.jpg?s=1024x768', 'Teku ,Kathmandu','Available', '10 k/month','',''),
       HostelModel('City View Boys Hostel', 'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_1000/v1653630139/blog/ziuq1c3rgudpaklqfztb.jpg', 'Koteswor ,Kathmandu','Available', '11 k/month','',''),
];

// final iconList = <IconData>[
//   Icons.home,
//     Icons.messenger,
//     Icons.money_off,
//     Icons.person,
//   ];
class DashBoardView extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
      
   
      body: ListView(
        shrinkWrap: true,
      children: [
        Container(height: 250,
        child: Stack(children: [
        
        
        
         // Text('data'),
        
        Container(
          height: 150,
           width: double.infinity,
        
        decoration: BoxDecoration(
    // image: DecorationImage(image:
    //  NetworkImage('https://th.bing.com/th/id/OIP.VmWZXFhOEqJ9m7vXkiAbggHaEK?pid=ImgDet&rs=1',),
    //  fit: BoxFit.cover),
   color: Colors.redAccent,
   borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(14)
  ,bottomRight: Radius.circular(14),
       )
        ),
        ),
        
        Positioned(
        
        left: MediaQuery.of(context).size.width/7,top: 100,
        
        child: Container(height: 120,width:MediaQuery.of(context).size.width/1.3,
        
        //300,
        
        decoration: BoxDecoration(color: Colors.white,
        
        borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.grey)
        
        ),
        
        
        
        child: Column(
        
        children: [
        
          TextFormField(
        controller: controller.searchQuery,
            decoration: InputDecoration(
        
              hintText: ' Enter city name'
        
            ),
        
          ),
        
          SizedBox(height: 15,),
        
        InkWell(onTap: (){
          controller.search();
          Get.to(SearchView());
        },
          child: Container(
          
          height: 40,width: 250,color: Colors.red,
          
          child: Center(child: Text('Search')),
          
          ),
        )
        
        
        
        ],
        
        ),
        
        )),
        
         
        
        
        ],),
        
        ),
     // HeaderOption(),
      //  Container(height: 58,child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //   Column(
      //     children: [
      //       CircleAvatar(
      //         child: Icon(Icons.house),
      //       ),
      //       Text('Room')
      //     ],
      //   ),Column(
      //     children: [
      //       CircleAvatar(
      //  child: Icon(Icons.hotel),
        
      //       ),
      //       Text('Hostel')
      //     ],
      //   ),Column(
      //     children: [
      //       CircleAvatar(
      //  child: Icon(CupertinoIcons.building_2_fill),
       
      //       ),Text('Hotel')
      //     ],
      //   ),Column(
      //     children: [
      //       CircleAvatar(
      //  child: Icon(CupertinoIcons.music_house),
      //       ),Text('Property')
      //     ],
      //   )
      // ],),),
      
      
      
      SizedBox(height: 30,),
      
      
         CarouselSlider(items: img.map((e) {
      return Builder(builder: (context){
      return InkWell(onTap: (){
      //Get.to(PropertyDetails());
      
      },child: Image.network(e,fit: BoxFit.cover,width: double.infinity,height: Get.height/2,),);
      // Container(
      //   decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(e))),
      // );
      });
      }).toList(),options:CarouselOptions(height: 120.0,
       aspectRatio: 16 / 6
      ,autoPlay: true,viewportFraction: 1
      
      ),
      
      
       ),
      
         SingleChildScrollView(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          SizedBox(height: 5,),
      Padding(
      padding: const EdgeInsets.all(8.0),
      child:   Text('Recent',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
          SizedBox(height: 10,),
      Container(height: 150,
      child:   
      
      Obx(()=>ListView.builder(scrollDirection: Axis.horizontal,itemCount:
      controller.recentData.value.length,
      //hostel.length ,
      itemBuilder: (context,index){
      var hostels=controller.recentData.value[index];
      
      //hostel[index];
      return Padding(
      padding: const EdgeInsets.all(8.0),
      child:   InkWell(
        onTap: ()async{

controller.getProfile();
      Get.toNamed(Routes.HOSTELDETAIL,arguments: {
              'roomId':hostels?.hostelId ,
              'roomNo': hostels?.roomNo,
            });
        },
        child: HostelCard(hostels: HostelModel(
hostels?.name,hostels?.photo,hostels?.city,
hostels?.isAvailable.toString() ,
hostels?.costPerMonth.toString(),'',''


        //   controller.recentData, image,
        //  location, isAvailable, price, 
        //  floor, noOfBeds
         ),isSmall: true,)),
      );
      
      },
      
      
      ))
      
      
      
      ),
      
      
      SizedBox(height: 20,),
             Text(' Suggested For You ',style: TextStyle(
      
            fontSize: 20,fontWeight: FontWeight.bold
          
          ),),
         SizedBox(height: 20,),
        //  Center(
        //    child: Wrap(alignment: WrapAlignment.center,
        //    runAlignment: WrapAlignment.center,
        //    crossAxisAlignment: WrapCrossAlignment.center,
        //    spacing: 10.0, // gap between adjacent chips
        //     runSpacing: 10.0,          
        //     children:List.generate(hostel.length, (index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: HostelCard(hostels: hostel[index]),
        //       );
        //     })
           
        //    ,),
        //  )




  //height: 300,
Obx(()=> GridView.builder(
  physics: NeverScrollableScrollPhysics(),
    itemCount:
    controller.suggestedData.length,
    // hostel.length,
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
  itemBuilder: (context,i){
  var hostels=controller.recentData.value[i];
    return GestureDetector(onTap: (){

       Get.toNamed(Routes.HOSTELDETAIL,arguments: {
              'roomId':hostels?.hostelId ,
              'roomNo': hostels?.roomNo,
            });
    },
      child: HostelCard(hostels: 
         // hostel[i]
      HostelModel(controller.suggestedData[i]!.name, 
      controller.suggestedData[i]!.photo, controller.suggestedData[i]!.city,
       controller.suggestedData[i]!.isAvailable.toString(), 
       controller.suggestedData[i]!.costPerMonth.toString(),
        '', '')
      ),
    );
  })),



          //  Container(height: 500,
          //    child: GridView.builder(
          //     shrinkWrap: true,
              
          //      physics: NeverScrollableScrollPhysics(),
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             
          //       crossAxisCount:Get.width>500?3:2,
          //       // 2, 
          //       crossAxisSpacing: 5,
                
          //       //10,
          //       mainAxisSpacing:2
          //       // 10// Number of columns in the grid
          //     ),
          //     itemCount: hostel.length,
          //     itemBuilder: (context,index){
          //       var hostels=hostel[index];
          //       return InkWell(
          //         onTap: (){
          //           Get.to(PropertyDetails());
          //         },
          //         child:
          //          HostelCard(hostels: hostels));
          //         },
              
          //     ),
          //  ),
                        //    ConstrainedBox(constraints: BoxConstraints(
                        //     minWidth: 100,
                        // minHeight: 50,
                        // maxWidth: 200,
                        // maxHeight: 450,
                
                        //    ),
                        //      child: Column(
                        //        children: [
                        //            Container(
                        //          height: 126,
                        //          width: 150,
                        //          decoration: BoxDecoration(
                        //            borderRadius: BorderRadius.circular(8),
                        //          ),
                        //          clipBehavior: Clip.antiAlias,
                        //          child: Image.network(
                        //            hostels.image,
                        //            fit: BoxFit.cover,height: 130,
                        //          ),
                        //        ),
                  
                        //         Text(hostels.name),
                        //         Text(hostels.location),
                        //         Text(hostels.price),
                        //         Text(hostels.isAvailable,style: TextStyle(color: Colors.green),)
                        //        ],
                        //      ),
                        //    );
            
         ],
       ),
         ),
      
      ],
        ),
    

    

    // floatingActionButton: Align(alignment: Alignment.bottomCenter,
    //   child: Padding(
    //     padding: const EdgeInsets.only(top:8.0,left: 24),
    //     child: FloatingActionButton(onPressed: (){
        
    //     },
    //     child: Icon(Icons.add,color: Colors.red,),backgroundColor: Colors.white,
    //     ),
    //   ),
    // ),bottomNavigationBar: AnimatedBottomNavigationBar.builder(itemCount: iconList.length,
    // tabBuilder: (int index,bool isActive){
    //     return Icon(
    //       iconList[index],
    //       size: 24,
    //       color: isActive ? Colors.red : Colors.black,
    //     );
        
    // },
    // activeIndex: 0,
    // //_bottomNavIndex,
    //   gapLocation: GapLocation.center,
    //   notchSmoothness: NotchSmoothness.verySmoothEdge,
    //   leftCornerRadius: 32,
    //   rightCornerRadius: 32,
    //   onTap: (v){},
    // ),
    //    floatingActionButton: Align(alignment: Alignment.bottomCenter,
    //   child: Padding(
    //     padding: const EdgeInsets.only(top:8.0,left: 24),
    //     child: FloatingActionButton(onPressed: (){
    //    Get.to(AddPropertyView());
    //     },
    //     child: Icon(Icons.add,color: Colors.red,),backgroundColor: Colors.white,
    //     ),
    //   ),
    // ),
     resizeToAvoidBottomInset: true,
    );
  }
  
}