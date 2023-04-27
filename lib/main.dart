import 'package:flutter/material.dart';
import 'package:lic_policies_clone/view/policies.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() {
  runApp(const MyApp());
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );
  // whenever your initialization is completed, remove the splash screen:

}
// whenever your initialization is completed, remove the splash screen:


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POLICY TRACKER',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Policies(),
    );
  }
}


