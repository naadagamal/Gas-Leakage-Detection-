
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_test/Screens/camera.dart';
import 'package:test_test/Screens/onbording.dart';
import 'package:test_test/widgets/home_switcher.dart';
import 'package:test_test/widgets/setting_item.dart';
import 'Screens/account_screen.dart';
import 'Screens/edit_screen.dart';
import 'Screens/help_screen.dart';
import 'Screens/language_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/notfications.dart';
import 'firebase_options.dart';
import 'home_screen.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleDarkMode(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/homeswitcher': (context) => HomeSwitcher(),
        '/settings': (context) => SettingsItem(),
        '/account': (context) => AccountScreen(onThemeChanged: _toggleDarkMode),
        '/login': (context) => LoginScreen(),
        '/language': (context) => LanguageScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/onbording': (context) => Onbording(),
        '/camera': (context) => CameraScreen(cameras: cameras),
        '/help': (context) => HelpScreen(),
        '/edit': (context) => EditAccountScreen(),
      },
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
}