import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/pages/add_note_page.dart';
import 'features/notes/presentation/bloc/note_bloc.dart';
import 'features/notes/presentation/pages/note_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  print("main");
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
      //home: NotePage(),
      initialRoute: "/",
      routes: {
        "/": (context) => BlocProvider(
              child: NotePage(),
              create: (context) => sl<NoteBloc>(),
            ),
      },
    );
  }
}
