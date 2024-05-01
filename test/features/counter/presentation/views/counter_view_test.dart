import 'dart:io';

import 'package:bloc_starter_project/core/widgets/loader.dart';
import 'package:bloc_starter_project/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_starter_project/features/counter/presentation/views/counter_view.dart';
import 'package:bloc_starter_project/features/counter/presentation/widgets/counter.dart';
import 'package:bloc_starter_project/features/counter/presentation/widgets/counter_cta.dart';
import 'package:bloc_starter_project/features/counter/presentation/widgets/update_cta.dart';
import 'package:bloc_starter_project/injection_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_utils/golden_devices.dart';
import '../../../../test_utils/testable_widget_factory.dart';
import 'counter_view_test.mocks.dart';

@GenerateMocks([CounterBloc])
void main() {
  group('CounterViewTest -', () {
    late MockCounterBloc bloc;
    late Widget testedWidget;

    setUp(() {
      bloc = MockCounterBloc();
      when(bloc.stream).thenAnswer((_) => const Stream<CounterState>.empty());
      getIt.registerFactory<CounterBloc>(() => bloc);
      testedWidget = testableWidgetFactory(const CounterView());
    });

    tearDown(() async {
      await getIt.reset();
    });

    group('ShowingCount -', () {
      setUp(() {
        when(bloc.state).thenAnswer((_) => const ShowingCount(4));
      });

      testWidgets('should show count', (tester) async {
        await tester.pumpWidget(testedWidget);
        await tester.pumpAndSettle();

        expect(find.byType(CounterCta), findsOneWidget);
        expect(find.byType(Counter), findsOneWidget);
        expect(find.byType(UpdateCta), findsOneWidget);
        expect(find.text('4'), findsOneWidget);
      });

      testGoldens(
        'ShowingCount goldens',
        (tester) async {
          await tester.pumpWidgetBuilder(testedWidget);
          await tester.pumpAndSettle();

          await multiScreenGolden(
            tester,
            'counter_view_showing_count',
            devices: devices,
          );
        },
        skip: !Platform.isMacOS,
      );
    });

    group('Loading -', () {
      setUp(() {
        when(bloc.state).thenAnswer((_) => const Loading());
      });

      testWidgets('should show count', (tester) async {
        await tester.pumpWidget(testedWidget);
        await tester.pump();

        expect(find.byType(Loader), findsOneWidget);
      });
    });
  });
}
