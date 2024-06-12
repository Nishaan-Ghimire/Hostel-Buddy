import 'package:flutter/material.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import 'dart:convert';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
const String baseUrl = 'https://api.openrouteservice.org/v2/directions/driving-car';

const String apiKey = '5b3ce3597851110001cf6248f55d7a31499e40848c6848d7de8fa624';

getRouteUrl(String startPoint, String endPoint){
  return Uri.parse('$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint');
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Raw coordinates got from  OpenRouteService
  List listOfPoints = [];

  // Conversion of listOfPoints into LatLng(Latitude, Longitude) list of points
  List<LatLng> points = [];

  // Method to consume the OpenRouteService API
  getCoordinates() async {
    // Requesting for openrouteservice api
    var response = await http.get(getRouteUrl(

"85.344622,27.67111",
'85.329928,27.650478'



    // '85.3240,27.7172', // Kathmandu
    //   '85.4298,27.6721', // Bhaktapur




      // "1.243344,6.145332",
      //  '1.2160116523406839,6.125231015668568'
        
        ));
    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listOfPoints = data['features'][0]['geometry']['coordinates'];
        points = listOfPoints
            .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          
          //backgroundColor: Colors.red,
          zoom: 15,
          center:
      
     LatLng (27.660794, 85.337275)
      //LatLng(27.6945, 85.3769),
          //LatLng(6.131015, 1.223898)
        ),
        children: [
          // Layer that adds the map
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          // Layer that adds points the map
          MarkerLayer(
            markers: [
              // First Marker
              Marker(
                point: 
          LatLng(27.7172, 85.3240),
             //   LatLng(6.145332, 1.243344),
                width: 80,
                height: 80,

                child: Icon(Icons.location_on,color: Colors.red,size: 22,),
              ),
              // Second Marker
              Marker(
                point: 
      LatLng(27.6721, 85.4298),
         //      LatLng(6.125231015668568, 1.2160116523406839),
                width: 80,
                height: 80,
                child:  Icon(Icons.location_on,color: Colors.green,size: 22,),
                // builder: (context) => IconButton(
                //   onPressed: () {},
                //   icon: const Icon(Icons.location_on),
                //   color: Colors.red,
                //   iconSize: 45,
                // ),
              ),
            ],
          ),

          // Polylines layer
          PolylineLayer(
            polylineCulling: false,
            polylines: [
              Polyline(
                  points: points, color: Colors.blue, strokeWidth: 5),
               
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () => getCoordinates(),
        child: const Icon( Icons.route,
          color: Colors.white,
        ),
      ),
    );
  }
}