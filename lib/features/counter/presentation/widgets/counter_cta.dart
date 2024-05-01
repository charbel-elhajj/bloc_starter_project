import 'package:bloc_starter_project/core/widgets/custom_floating_action_button.dart';
import 'package:bloc_starter_project/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCta extends StatelessWidget {
  const CounterCta({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(
      onPressed: () => BlocProvider.of<CounterBloc>(context).add(const CounterIncrement()),
      child: const Icon(Icons.add),
    );
  }
}
