import 'package:changetheme/Src/Bloc/Bloc.dart';
import 'package:changetheme/Src/Bloc/State.dart';
import 'package:changetheme/Src/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ChangeThemeBloc();
      },
    child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
      builder: (context,state){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
          title: state.name,
          color: Color(0xFFE6E3AC),
          theme: state.changeTheme,
          home: const HomePage(),
        );
      }),
    );
  }
}