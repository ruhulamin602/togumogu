// import 'dart:async';

// // import 'package:authentication_repository/authentication_repository.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:togumogu/src/repository/authentication_repository.dart';
// // import 'package:user_repository/user_repository.dart';
// part 'authentication_event.dart';
// part 'authentication_state.dart';

// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   AuthenticationBloc({
//     @required AuthenticationRepository authenticationRepository,
//   })  : assert(authenticationRepository != null),
//         _authenticationRepository = authenticationRepository,
//         super(const AuthenticationState.unknown()) {
//     _authenticationStatusSubscription = _authenticationRepository.status.listen(
//       (status) => add(AuthenticationStatusChanged(status)),
//     );
//   }

//   final AuthenticationRepository _authenticationRepository;

//   StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

//   @override
//   Stream<AuthenticationState> mapEventToState(
//     AuthenticationEvent event,
//   ) async* {
//     if (event is AuthenticationStatusChanged) {
//       yield await _mapAuthenticationStatusChangedToState(event);
//     } else if (event is AuthenticationLogoutRequested) {
//       _authenticationRepository.logOut();
//     }
//   }

//   @override
//   Future<void> close() {
//     _authenticationStatusSubscription?.cancel();
//     _authenticationRepository.dispose();
//     return super.close();
//   }

//   Future<AuthenticationState> _mapAuthenticationStatusChangedToState(
//     AuthenticationStatusChanged event,
//   ) async {
//     switch (event.status) {
//       case AuthenticationStatus.unauthenticated:
//         return const AuthenticationState.unauthenticated();
//       case AuthenticationStatus.authenticated:
//         final token = await _tryGetToken();
//         return token != null
//             ? AuthenticationState.authenticated(token)
//             : const AuthenticationState.unauthenticated();
//       default:
//         return const AuthenticationState.unknown();
//     }
//   }

//   Future<String> _tryGetToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     try {
//       final token = prefs.getString("token");
//       return token;
//     } on Exception {
//       return null;
//     }
//   }
// }
