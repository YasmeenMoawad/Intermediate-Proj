import 'package:flutter/material.dart';
import 'package:intermediate_final_project/ui/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:intermediate_final_project/ui/widgets/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider<MyProvider>(create: (_) => MyProvider()),
    ],
    child: MaterialApp(
      home: Login(),
    ),
    );
  }
}
