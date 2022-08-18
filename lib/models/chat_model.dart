import 'message_model.dart';
import 'user_model.dart';

class Chat {
  final String? id;
  final List<User>? users;
  final List<Message>? messages;

  const Chat({
    this.id,
    this.users = const <User>[],
    this.messages = const <Message>[],
  });

  Chat copyWith({
    String? id,
    List<User>? users,
    List<Message>? messages,
  }) {
    return Chat(
      id: id ?? this.id,
      users: users ?? this.users,
      messages: messages ?? this.messages,
    );
  }

  static List<Chat> chats = [
    Chat(
      id: '0',
      users:
          User.users.where((user) => user.id == '1' || user.id == '2').toList(),
      messages: Message.messages
          .where(
            (message) =>
                (message.senderId == '1' || message.senderId == '2') &
                (message.recipientId == '1' || message.recipientId == '2'),
          )
          .toList(),
    ),
    Chat(
      id: '1',
      users:
          User.users.where((user) => user.id == '1' || user.id == '3').toList(),
      messages: Message.messages
          .where(
            (message) =>
                (message.senderId == '1' || message.senderId == '3') &
                (message.recipientId == '1' || message.recipientId == '3'),
          )
          .toList(),
    ),
    Chat(
      id: '2',
      users:
          User.users.where((user) => user.id == '1' || user.id == '4').toList(),
      messages: Message.messages
          .where(
            (message) =>
                (message.senderId == '1' || message.senderId == '4') &
                (message.recipientId == '1' || message.recipientId == '4'),
          )
          .toList(),
    ),
  ];
}
