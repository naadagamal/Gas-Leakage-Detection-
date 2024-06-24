import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


/*
late List<CameraDescription> cameras;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,

      ),
      home: CameraApp(),
    );
  }
}

class CameraApp extends StatefulWidget {
  const CameraApp ({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }


}

class Camera extends StatefulWidget {
  const Camera ({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraState extends State<CameraApp> {
  late CameraController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case'CameraAccessDenied':
            print("access was denied");
            break;
          default:
            print(e.description);
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(height: double.infinity, child: CameraPreview(_controller),
        ),
      ],),
    );
  }
}*/


class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({Key? Key, required this.cameras}) : super(key: Key);
  @override
  State<CameraScreen> createState() => _CameraScreenState();

  }

class _CameraScreenState extends State<CameraScreen> {

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera"),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_controller);

          }
        else{
          return Center(child: CircularProgressIndicator());
          }
        }
      ),
    /* floatingActionButton: FloatingActionButton(
       onPressed: () async {
         try{
           await _initializeControllerFuture;
           final path = join(
               (await getTemporaryDirectory()).path,
             '${DateTime.now()}.png',
           );

         }
       },
       child: Icon(Icons.camera_alt),
     ),*/
    );
  }
}

