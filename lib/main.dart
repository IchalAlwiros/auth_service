import 'package:final_project_bootcampflutter/services/api/ApiServices.dart';
import 'package:final_project_bootcampflutter/services/auth/Auth_services.dart';
import 'package:final_project_bootcampflutter/services/theme_provider/theme_provider.dart';
import 'package:final_project_bootcampflutter/ui/home_screen_resto.dart';
import 'package:final_project_bootcampflutter/ui/login_screen_resto.dart';
import 'package:final_project_bootcampflutter/ui/splash_screen_resto.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiService>(
          create: (context) => ApiService(),
        ),
        ChangeNotifierProvider<AuthServices>(
          create: (context) => AuthServices(),
        ),
        ChangeNotifierProvider<AuthServices>(
          create: (context) => AuthServices(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => LoginScreen(),
          '/restaurant': (context) => RestaurantPage(),
        },
        theme: ThemeData(primarySwatch: Colors.amber),
      ),
    );
  }
}
