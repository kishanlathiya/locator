import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    ),
  );
}

Widget permission({required String image, required String name}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(),
          //color: Colors.red,
        ),
        height: 85,
        width: 85,
        alignment: Alignment.center,
      ),
      Text(
        name,
        style: TextStyle(fontSize: 18),
      ),
    ],
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Permissions App"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    openAppSettings();
                  });
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 30),
                InkWell(
                  onTap: () async {
                    PermissionStatus res = await Permission.storage.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("storage is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("storage is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("storage is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("storage is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child: permission(
                      image: "assets/images/storage.png", name: "Storage"),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () async {
                    PermissionStatus res = await Permission.phone.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("phone is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("phone is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("phone is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("phone is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child: permission(
                      image: "assets/images/phone.png", name: "Phone"),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () async {
                    PermissionStatus res = await Permission.calendar.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("calendar is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("calendar is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("calendar is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("calendar is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child: permission(
                      image: "assets/images/calendar.png", name: "Calendar"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 30),
                InkWell(
                  onTap: () async {
                    PermissionStatus res = await Permission.location.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Location is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Location is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Location is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Location is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child: permission(
                      image: "assets/images/location.png", name: "Location"),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () async {
                    PermissionStatus res =
                        await Permission.bluetoothConnect.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("bluetooth is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("bluetooth is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("bluetooth is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("bluetooth is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child: permission(
                      image: "assets/images/bluetooth.png", name: "Bluetooth"),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () async {
                    PermissionStatus res = await Permission.camera.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("videos is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("videos is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("videos is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("videos is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child: permission(
                      image: "assets/images/video.png", name: "Videos"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 30),
                InkWell(
                  onTap: () async {
                    PermissionStatus res = await Permission.sms.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("sms is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("sms is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("sms is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("sms is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child:
                      permission(image: "assets/images/sms.png", name: "SMS"),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    PermissionStatus res =
                        await Permission.microphone.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("microphone is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("microphone is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("microphone is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("microphone is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child: permission(
                      image: "assets/images/microphone.png",
                      name: "Microphone"),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    PermissionStatus res = await Permission.audio.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("audio is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("audio is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("audio is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("audio is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child: permission(
                      image: "assets/images/audio.png", name: "Audio"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 30),
                InkWell(
                  onTap: () async {
                    PermissionStatus res = await Permission.camera.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("camera is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("camera is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("camera is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("camera is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child:
                      permission(image: "assets/images/camera.png", name: "Camera"),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    PermissionStatus res = await Permission.notification.request();
                    setState(() {
                      if (res == PermissionStatus.granted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("notification is granted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.permanentlyDenied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("notification is permanently Denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.denied) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("notification is denied"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      } else if (res == PermissionStatus.restricted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("notification is restricted"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating));
                      }
                    });
                  },
                  child:
                  permission(image: "assets/images/notification.png", name: "Notification"),
                ),
              ],
            ),
          ],
        )));
  }
}
