import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/bloc/home_cubit.dart';
import 'package:hidoc/presentation/home/home_page.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeScreenCubit>(
      create: (BuildContext context) => HomeScreenCubit(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}
