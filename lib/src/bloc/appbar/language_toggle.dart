import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class LanguageCubit extends Cubit<bool> {
//   LanguageCubit() : super(true);
//   bool _isSwitched = true;
//   bool get isSwitched => _isSwitched;

//   toggleLanguage() {
//     _isSwitched = !_isSwitched;
//   }
// }
enum LanguageEvent {
  /// Notifies bloc to increment state.
  change,

  /// Notifies bloc to decrement state.

}

/// {@template counter_bloc}
/// A simple [Bloc] which manages an `int` as its state.
/// {@endtemplate}
///

class LanguageBloc extends Bloc<LanguageEvent, bool> {
  /// {@macro counter_bloc}
  LanguageBloc() : super(true);

  bool get isSwitched {
    // print(_isSwitched);
    return state;
  }

  @override
  Stream<bool> mapEventToState(LanguageEvent event) async* {
    switch (event) {
      case LanguageEvent.change:
        yield !state;
        break;

      default:
        addError(Exception('unsupported event'));
    }
  }
}
