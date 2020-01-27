import 'package:flutter/material.dart';
import 'package:flutter_module/datamodels/user_location.dart';
import 'package:flutter_module/services/location_service.dart';
import 'package:flutter_module/views/home_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return StreamProvider<UserLocation>(
      create: (context) => LocationServices().locationStream,
      child: MaterialApp(
      title: 'location module',
      home: Scaffold(
        body: HomeView(),
      ),
      ),
      );
  }
}