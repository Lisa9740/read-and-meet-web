import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../screens/posts/post.details.screen.dart';

class GoogleMapView extends StatefulWidget {
  GoogleMapView({Key? key, this.posts, this.postView}) : super(key: key);
  final posts;
  Widget? postView;

  GoogleMapController? mapController;

  @override
  _GoogleMapViewState createState() => _GoogleMapViewState();
}


class _GoogleMapViewState extends State<GoogleMapView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    void _closeModal(void value) {

    }

    void _showModal(post) {
      Future<void> future = showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return PostDetailsScreen(currentPost: post);
        },
      );
      future.then((void value) => _closeModal(value));
    }


    final screenWidth = MediaQuery.of(context).size.width;
    var posts = widget.posts;
    Set<Marker> postPositions = {};
    if (posts != null){
      for (var post in posts) {
        postPositions.add(
            Marker(
              onTap: () {
                _showModal(post);
                // Navigator.of(context).pushNamed(PostDetailsScreen.routeName, arguments: PostScreenArguments(post));
              },
              markerId: MarkerId(post.postId.toString()),
              position: LatLng(double.parse(post.lat), double.parse(post.long)),
            )
        );
      }
    }


    return  Container(
      alignment: Alignment.centerLeft,
      height: 500,
      child: GoogleMap(
          scrollGesturesEnabled : false,
          mapType:  MapType.normal,
          initialCameraPosition: const CameraPosition(
              target: LatLng(-21.115141, 55.536384),
              zoom: 10
          ),
          markers: postPositions,
          minMaxZoomPreference: const MinMaxZoomPreference(10,17),
          onMapCreated: (GoogleMapController controller){
            widget.mapController = controller;
          }),
    );
  }

}