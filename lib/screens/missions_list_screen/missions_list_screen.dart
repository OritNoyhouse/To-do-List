import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'missions_list_bloc.dart';

class MissionsListScreenConstants {
  static const String missionsList = "Missions List";
  static const String emptyList = "There is no items in the to do list";
  static const String addMission = "Add mission";
}

class MissionsListScreen extends StatefulWidget {
  const MissionsListScreen({super.key});

  @override
  MissionsListScreenState createState() => MissionsListScreenState();
}

class MissionsListScreenState extends State<MissionsListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MissionsBloc>().showMissions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MissionsBloc, MissionsState>(
      builder: (context, state) {
        if (state.executionState == ExecutionState.executing) {
          return const Center(
            child: CircularProgressIndicator(), // The loading indicator
          );
        }
        if (state.executionState == ExecutionState.completed) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(MissionsListScreenConstants.missionsList),
              centerTitle: true,
            ),
            body: state.missions.isEmpty
                ? const Center(
                    child: Text(MissionsListScreenConstants.emptyList),
                  )
                : ListView.builder(
                    itemCount: state.missions.length,
                    itemBuilder: (context, index) {
                      // Passing each item to the MissionsCard
                      return MissionsCard(missionName: state.missions[index]);
                    },
                  ),
            floatingActionButton: ElevatedButton(
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(MissionsListScreenConstants.addMission),
                  Icon(Icons.add)
                ],
              ),
              onPressed: () => Navigator.pushNamed(context, '/addMission'),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class MissionsCard extends StatelessWidget {
  const MissionsCard({super.key, required this.missionName});

  final String missionName;

  // This widget is a mission card.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        child: Text(missionName),
      ),
    );
  }
}
