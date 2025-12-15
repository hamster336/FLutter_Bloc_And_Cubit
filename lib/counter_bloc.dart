import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterIncrement {}

class CounterBloc extends Bloc<CounterIncrement, int> {
  CounterBloc(super.initialState) {
    on<CounterIncrement>((event, emit) {
      emit(state + 1);

      /// we cannot access emit outside handlers in bloc unlike cubit
      log('Initial state: $state');
    });
  }
}
