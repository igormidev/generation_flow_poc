import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:generation_flow_poc/data/models/flow_step.dart';

part 'flow_state.freezed.dart';

@freezed
abstract class FlowState with _$FlowState {
  factory FlowState({
    required Map<int, FlowStep> history,
  }) = _FlowStateLoading;
}
