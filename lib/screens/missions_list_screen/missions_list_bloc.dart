import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ExecutionState {
  none,
  executing,
  completed,
  failed,
  disabled,
}

class MissionsState extends Equatable {
  const MissionsState({
    this.errMsg = "",
    this.executionState = ExecutionState.executing,
    required this.missions,
  });

  final ExecutionState executionState;
  final List<String> missions;

  final String errMsg;

  MissionsState copyWith({
    ExecutionState? executionState,
    required List<String> missions,
    String? errMsg,
  }) {
    return MissionsState(
      executionState: executionState ?? this.executionState,
      missions: missions,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  List<Object?> get props => [executionState, missions, errMsg];
}

class MissionsBloc extends Cubit<MissionsState> {
  MissionsBloc() : super(const MissionsState(missions: []));
  List<String> missions = [];

  void showMissions() {
    emit(state.copyWith(
        missions: missions, executionState: ExecutionState.completed));
  }

  void saveNewMission(String mission) {
    emit(state.copyWith(
        missions: missions, executionState: ExecutionState.executing));
    missions.add(mission);
    emit(state.copyWith(
        missions: missions, executionState: ExecutionState.completed));
  }
}
