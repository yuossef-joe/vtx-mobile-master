import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  final String userName;
  final String email;
  final String password;
  final String phone;
  final String countryCode;

  const RegisterButtonPressed({
    required this.userName,
    required this.email,
    required this.password,
    required this.phone,
    required this.countryCode,
  });

  @override
  List<Object> get props => [userName, email, password, phone, countryCode];
}
