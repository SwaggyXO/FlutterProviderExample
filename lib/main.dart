import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prac/controller/user_notifier.dart';
import 'package:provider_prac/screens/home.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserNotifier())
    ],

    child: const MyApp(),  
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super (key: key);

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.indigo),
        primarySwatch: Colors.indigo,
      ),

      home: const Home(),
    );
  }
}
