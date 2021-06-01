import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// bloc 으로 쏘는 이벤트 정의
// 받아오는 인자가 없는 경우 enum 으로 정의하는 경우도 보았음
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
