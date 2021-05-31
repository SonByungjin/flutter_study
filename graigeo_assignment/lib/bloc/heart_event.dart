import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HeartEvent extends Equatable {}

class ListHeartEvent extends HeartEvent {
  @override
  List<String> get props => [];
}

class CreateHeartEvent extends HeartEvent {
  final String item;

  CreateHeartEvent(this.item);

  @override
  List<Object> get props => [this.item];
}

class DeleteHeartEvent extends HeartEvent {
  final String item;

  DeleteHeartEvent(this.item);

  @override
  List<Object> get props => [this.item];
}
