import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:changetheme/Src/Bloc/Bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChanged = false;
  _lightTheme(context){
    BlocProvider.of<ChangeThemeBloc>(context).add(LightThemeEvent());
  }
  _darkTheme(context){
    BlocProvider.of<ChangeThemeBloc>(context).add(DarkThemeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.brightness_6
            ),
            tooltip: 'Theme Selector',
            onPressed: (){
              setState((){
                !isChanged?_lightTheme(context):_darkTheme(context);
                isChanged=!isChanged;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        },
        child: const Icon(
          Icons.done,
          color: Color(0xFFE6E3AC),
        ),
      ),
    );
  }
}
