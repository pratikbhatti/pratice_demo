import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratik_testing/src/presentation/view/homePage/bloc/home_bloc.dart';
import 'package:pratik_testing/src/presentation/view/homePage/ui/home_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc(),
      ),
    ],
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
