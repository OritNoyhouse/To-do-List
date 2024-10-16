import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/screens/add_mision_screen/add_mision_screen.dart';
import 'package:to_do_list/screens/missions_list_screen/missions_list_bloc.dart';
import 'package:to_do_list/screens/missions_list_screen/missions_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MissionsBloc(),
      child: MaterialApp(
        title: 'To do List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/missions': (context) => const MissionsListScreen(),
          '/addMission': (context) => const AddMissionScreen(),
          // Add more routes here as needed
        },
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome",
          style: TextStyle(fontSize: 50),
        ),
        centerTitle: true,
      ),
      body: TextButton(
        child: const Center(
          child: Text("Show to do List"),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/missions');
        },
      ),
    );
  }
}
