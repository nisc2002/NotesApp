import 'package:flutter/material.dart';
import 'features/notes/presentation/pages/note_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(textTheme: TextTheme()),
      title: 'Material App',
      home: NotePage(),
    );
  }
}
