import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class Global {
  static List<Map> permissionList = [
    {
      'name': "Camera",
      'icon': const Icon(Icons.camera),
      'request': Permission.camera,
    },
    {
      'name': "Location",
      'icon': const Icon(Icons.gps_fixed),
      'request': Permission.location,
    },
    {
      'name': "Bluetooth",
      'icon': const Icon(Icons.bluetooth),
      'request': Permission.bluetooth,
    },
    {
      'name': "Calendar",
      'icon': const Icon(Icons.calendar_month),
      'request': Permission.calendar,
    },
    {
      'name': "Microphone",
      'icon': const Icon(Icons.mic),
      'request': Permission.microphone,
    },
    {
      'name': "Contacts",
      'icon': const Icon(Icons.person),
      'request': Permission.microphone,
    },
  ];
}
