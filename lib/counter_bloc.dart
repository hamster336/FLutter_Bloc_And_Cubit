import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

// sealed class - can be inherited within the same file only
// final class - cannot be inherited at all

// base event extending increment and decrement events
sealed class CounterEvent {}      

final class CounterIncrement extends CounterEvent {}

final class CounterDecrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(super.initialState) {
    on<CounterIncrement>(_increment);
    on<CounterDecrement>(_decrement);
  }

  void _increment(CounterEvent event, Emitter emit) {
    emit(state + 1);

    /// we cannot access emit outside handlers in bloc unlike cubit
    log('Initial state: $state');
  }

  void _decrement(CounterEvent event, Emitter emit) {
    emit(state - 1);

    /// we cannot access emit outside handlers in bloc unlike cubit
    log('Initial state: $state');
  }
}
