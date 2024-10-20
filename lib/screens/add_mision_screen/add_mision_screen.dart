import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../missions_list_screen/missions_list_bloc.dart';

class AddMissionScreenConstants {
  static const String addMission = "Add a mission";
  static const String missionName = "Mission name";
  static const String saveMission = "Save mission";
}

class AddMissionScreen extends StatelessWidget {
  const AddMissionScreen({super.key});

  // This widget add a mission to the to do list.
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AddMissionScreenConstants.addMission),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  labelText: AddMissionScreenConstants.missionName),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final missionName = controller.text;
                if (missionName.isNotEmpty) {
                  context.read<MissionsBloc>().saveNewMission(missionName);
                  // Navigate back to the to do list screen
                  Navigator.pop(context);
                }
              },
              child: const Text(AddMissionScreenConstants.saveMission),
            )
          ],
        ),
      ),
    );
  }
}
