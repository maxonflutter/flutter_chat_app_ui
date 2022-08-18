import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../widgets/custom_container.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  late String text;
  late User user;
  late Chat chat;

  @override
  void initState() {
    user = Get.arguments[0];
    chat = Get.arguments[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary,
          ],
        ),
      ),
      child: Scaffold(
        appBar: _CustomAppBar(user: user),
        backgroundColor: Colors.transparent,
        body: CustomContainer(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ChatMessages(
                scrollController: scrollController,
                chat: chat,
              ),
              TextFormField(
                controller: textEditingController,
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      Theme.of(context).colorScheme.secondary.withAlpha(150),
                  hintText: 'Type here...',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(20.0),
                  suffixIcon: _buildIconButton(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconButton _buildIconButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.send),
      color: Theme.of(context).iconTheme.color,
      onPressed: () {
        Message message = Message(
          senderId: '1',
          recipientId: '2',
          text: text,
          createdAt: DateTime.now(),
        );
        List<Message> messages = List.from(chat.messages!)..add(message);
        messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        setState(() {
          chat = chat.copyWith(messages: messages);
        });
        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        textEditingController.clear();
      },
    );
  }
}

class _ChatMessages extends StatelessWidget {
  const _ChatMessages({
    Key? key,
    required this.scrollController,
    required this.chat,
  }) : super(key: key);

  final ScrollController scrollController;
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        controller: scrollController,
        itemCount: chat.messages!.length,
        itemBuilder: (context, index) {
          Message message = chat.messages![index];
          return Align(
            alignment: (message.senderId == '1')
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.66,
              ),
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: (message.senderId == '1')
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                message.text,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            '${user.name} ${user.surname}',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            'Online',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.imageUrl),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
