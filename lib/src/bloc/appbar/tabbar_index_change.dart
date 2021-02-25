
import 'package:flutter_bloc/flutter_bloc.dart';

// class LanguageCubit extends Cubit<bool> {
//   LanguageCubit() : super(true);
//   bool _isSwitched = true;
//   bool get isSwitched => _isSwitched;

//   toggleLanguage() {
//     _isSwitched = !_isSwitched;
//   }
// }
enum TabbarEvent {
  /// Notifies bloc to increment state.
  // home,
  // wishList,
  // tracker,
  // cart,
  // notifications,
  // settingMenu,
  onTap,

  /// Notifies bloc to decrement state.

}

/// {@template counter_bloc}
/// A simple [Bloc] which manages an `int` as its state.
/// {@endtemplate}
///

class TabbarBloc extends Bloc<TabbarEvent, List<int>> {
  /// {@macro counter_bloc}
  TabbarBloc() : super([0,0]);
  int _selectedIndex1=0;
  int _selectedIndex2=0;
  
  
  get setFirstIndex {
    return _selectedIndex1;
  }
  get setSecondIndex {
    return _selectedIndex2;
  }

  getfirstIndex(int index) {
    _selectedIndex1 = index;
  }
  getSecondIndex(int index) {
    _selectedIndex2 = index;
  }

  @override
  Stream<List<int>> mapEventToState(TabbarEvent event) async* {
    switch (event) {
      case TabbarEvent.onTap:
        yield [_selectedIndex1,_selectedIndex2] ;
        break;
      // case TabbarEvent.wishList:
      //   yield 1;
      //   break;
      // case TabbarEvent.tracker:
      //   yield 2;
      //   break;
      // case TabbarEvent.cart:
      //   yield 3;
      //   break;
      // case TabbarEvent.notifications:
      //   yield 4;
      //   break;
      // case TabbarEvent.settingMenu:
      //   yield 5;
      //   break;

      default:
        addError(Exception('unsupported event'));
    }
  }
}
