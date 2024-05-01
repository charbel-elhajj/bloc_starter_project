import 'package:bloc_starter_project/core/utils/extensions.dart';
import 'package:bloc_starter_project/core/widgets/custom_text.dart';
import 'package:bloc_starter_project/core/widgets/loader.dart';
import 'package:bloc_starter_project/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if (state is ShowingCount) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText('counter.body'.tr(context)),
              CustomText('${state.count}', type: TextType.h2),
            ],
          );
        } else if (state is Loading) {
          return const Loader();
        }

        return Container();
      },
    );
  }
}
