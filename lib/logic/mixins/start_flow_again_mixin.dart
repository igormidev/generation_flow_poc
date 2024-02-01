import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generation_flow_poc/data/services/mock_generator_service.dart';
import 'package:generation_flow_poc/logic/cubits/flow_cubit.dart';
import 'package:generation_flow_poc/ui/pages/flow_page.dart';

mixin StartFlowAgainMixin<T extends StatefulWidget> on State<T> {
  void resetFlow() {
    mockFlowIndex = 0;

    context.read<FlowCubit>().createFlow();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return const FlowPage(
          step: 0,
        );
      },
    ), (route) => false);
  }
}
