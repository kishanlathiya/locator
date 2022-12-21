import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'global.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Permission> list = [
    Permission.camera,
    Permission.location,
    Permission.bluetooth,
    Permission.calendar,
    Permission.microphone,
    Permission.contacts,
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permissions App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              openAppSettings();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: Global.permissionList.length,
          itemBuilder: (context, i) {
            return Card(
              child: ListTile(
                onTap: () async {
                  bool permissionStatus = await list[i].isGranted;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Permission Status"),
                          content: Container(
                            alignment: Alignment.center,
                            height: 80,
                            width: _width,
                            child: Column(
                              children: [
                                (permissionStatus)
                                    ? Text(
                                        "${Global.permissionList[i]['name']}'s Permission Is Granted")
                                    : Text(
                                        "${Global.permissionList[i]['name']}'s Permission is Not granted"),
                              ],
                            ),
                          ),
                          actions: [
                            (permissionStatus)
                                ? Container()
                                : ElevatedButton(
                                    onPressed: () async {
                                      await list[i].request();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Request")),
                          ],
                        );
                      });
                },
                leading: Global.permissionList[i]['icon'],
                title: Text("${Global.permissionList[i]['name']}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
