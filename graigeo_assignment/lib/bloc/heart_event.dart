abstract class HeartEvent{}

// bloc 으로 쏘는 이벤트 정의
// 받아오는 인자가 없는 경우 enum 으로 정의하는 경우도 보았음
class ListHeartEvent extends HeartEvent {}

class CreateHeartEvent extends HeartEvent {
  final String item;

  CreateHeartEvent(this.item);
}

class DeleteHeartEvent extends HeartEvent {
  final String item;

  DeleteHeartEvent(this.item);
}
