import 'package:bloc_starter_project/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCta extends StatelessWidget {
  const UpdateCta({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => BlocProvider.of<CounterBloc>(context).add(const CounterUpdate()),
      icon: const Icon(Icons.update),
      color: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
