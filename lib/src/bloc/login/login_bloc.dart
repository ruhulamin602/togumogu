// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:formz/formz.dart';
// import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'models/models.dart';
// import 'package:togumogu/src/repository/authentication_repository.dart';

// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc({
//     @required AuthenticationRepository authenticationRepository,
//   })  : assert(authenticationRepository != null),
//         _authenticationRepository = authenticationRepository,
//         super(const LoginState());

//   final AuthenticationRepository _authenticationRepository;

//   @override
//   Stream<LoginState> mapEventToState(
//     LoginEvent event,
//   ) async* {
//     if (event is LoginUsernameChanged) {
//       yield _mapUsernameChangedToState(event, state);
//     } else if (event is LoginUsernameUnfocused) {
//       final username = Username.dirty(state.username.value);
//       yield state.copyWith(
//         username: username,
//         status: Formz.validate([username, state.password]),
//       );
//     } else if (event is LoginPasswordChanged) {
//       yield _mapPasswordChangedToState(event, state);
//     } else if (event is PasswordUnfocused) {
//       final password = Password.dirty(state.password.value);
//       yield state.copyWith(
//         password: password,
//         status: Formz.validate([state.username, password]),
//       );
//     } else if (event is LoginSubmitted) {
//       yield* _mapLoginSubmittedToState(event, state);
//     }
//   }

//   LoginState _mapUsernameChangedToState(
//     LoginUsernameChanged event,
//     LoginState state,
//   ) {
//     final username = Username.dirty(event.username);
//     return state.copyWith(
//       username: username,
//       status: Formz.validate([state.password, username]),
//     );
//   }

//   LoginState _mapPasswordChangedToState(
//     LoginPasswordChanged event,
//     LoginState state,
//   ) {
//     final password = Password.dirty(event.password);
//     return state.copyWith(
//       password: password,
//       status: Formz.validate([password, state.username]),
//     );
//   }

//   Stream<LoginState> _mapLoginSubmittedToState(
//     LoginSubmitted event,
//     LoginState state,
//   ) async* {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final username = Username.dirty(state.username.value);
//     final password = Password.dirty(state.password.value);
//     yield state.copyWith(
//       username: username,
//       password: password,
//       status: Formz.validate([username, password]),
//     );
//     if (state.status.isValidated) {
//       yield state.copyWith(status: FormzStatus.submissionInProgress);
//       try {
//         // String token = prefs.getString('token');
        
//         yield state.copyWith(
            
//             _authenticationRepository.isAuth?
//                  FormzStatus.submissionFailure
//                 : FormzStatus.submissionSuccess);
//       } on Exception catch (_) {
//         yield state.copyWith(status: FormzStatus.submissionFailure);
//       }
//     }
//   }
// }
