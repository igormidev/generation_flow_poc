import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generation_flow_poc/data/models/episode_time_enum.dart';
import 'package:generation_flow_poc/data/repositories/flow_repository.dart';
import 'package:generation_flow_poc/logic/states/flow_state.dart';

class FlowCubit extends Cubit<FlowState> {
  final FlowRepository _repository;

  FlowCubit({
    required FlowRepository repository,
  })  : _repository = repository,
        super(FlowState(history: {}));

  Future<void> createFlow() async {
    emit(FlowState(history: {}));
    final response = await _repository.createFlow();
    emit(FlowState(history: {0: response}));
  }

  Future<void> runFlowStep(int stepIndex, String text) async {
    final response = await _repository.runFlowStep(text);
    final prevHist = {...state.history};
    prevHist[stepIndex] = response;

    emit(FlowState(
      history: prevHist,
    ));
  }

  Future<void> showDiferrentAnswers(int stepIndex) async {
    final prevHist = {...state.history};
    prevHist.remove(stepIndex);
    emit(FlowState(history: prevHist));
    final response = await _repository.runFlowStep("Show me different answers");
    final newMap = Map.from(prevHist);
    newMap[stepIndex] = response;
    emit(FlowState(
      history: {...newMap},
    ));
  }

  Future<void> finishFlow({
    required EEpisodeTime episodeLenght,
    required List<String> titles,
  }) async {
    await _repository.finishFlow(
      episodeLenght: episodeLenght,
      titles: titles,
    );
  }
}
