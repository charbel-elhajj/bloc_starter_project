import 'package:bloc_starter_project/core/utils/extensions.dart';
import 'package:bloc_starter_project/core/widgets/custom_text.dart';
import 'package:bloc_starter_project/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_starter_project/features/counter/presentation/widgets/counter_cta.dart';
import 'package:bloc_starter_project/features/counter/presentation/widgets/counter.dart';
import 'package:bloc_starter_project/features/counter/presentation/widgets/update_cta.dart';
import 'package:bloc_starter_project/injection_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CounterBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: CustomText(
            'counter.title'.tr(context),
            type: TextType.h1,
            copyWith: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          actions: const [UpdateCta()],
        ),
        body: const Center(child: Counter()),
        floatingActionButton: const CounterCta(),
      ),
    );
  }
}
