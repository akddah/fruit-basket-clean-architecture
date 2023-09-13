import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class ClickLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
