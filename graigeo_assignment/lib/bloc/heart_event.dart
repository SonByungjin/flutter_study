abstract class HeartEvent{}

class ListHeartEvent extends HeartEvent {}

class CreateHeartEvent extends HeartEvent {
  final String item;

  CreateHeartEvent(this.item);
}

class DeleteHeartEvent extends HeartEvent {
  final String item;

  DeleteHeartEvent(this.item);
}
