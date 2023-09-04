import 'package:edudoc/app/modules/splash_module/splash_controller.dart';
import 'package:edudoc/app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/splash_module/splash_binding.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        //    check for errors
        if (snapshot.hasError) {
          debugPrint('Somthing went Wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          debugPrint('firebase connected');
        }

        return GetMaterialApp(
            title: 'EduDoc Application',
            debugShowCheckedModeBanner: false,
            getPages: AppPages.pageList,
            initialRoute: AppRoutes.splashScreen,
            initialBinding: SplashBinding(),
            onInit: () {
              SplashController().onInit();
            }
            // home: SplashController(),
            );
      },
    );
  }
}
