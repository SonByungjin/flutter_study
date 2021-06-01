import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// bloc 에서 받는 state 값 정의
@immutable
abstract class HeartState extends Equatable {}

class Empty extends HeartState {
  @override
  List<Object> get props => [];
}

class Loading extends HeartState {
  @override
  List<Object> get props => [];
}

class Error extends HeartState {
  final String message;

  Error(this.message);

  @override
  List<Object> get props => [this.message];
}

class Loaded extends HeartState {
  final List<String> hearts;

  Loaded(this.hearts);

  @override
  List<String> get props => this.hearts;
}
