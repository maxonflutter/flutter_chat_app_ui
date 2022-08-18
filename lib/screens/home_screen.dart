import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    List<User> users = User.users;
    List<Chat> chats = Chat.chats;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      child: Scaffold(
        appBar: const _CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ChatContacts(height: height, users: users),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _ChatMessages(height: height, chats: chats),
                  _CustomBottomNavBar(width: width),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatContacts extends StatelessWidget {
  const _ChatContacts({
    Key? key,
    required this.height,
    required this.users,
  }) : super(key: key);

  final double height;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.125,
      margin: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, index) {
          User user = users[index];
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(user.imageUrl),
                ),
                const SizedBox(height: 10),
                Text(
                  user.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ChatMessages extends StatelessWidget {
  const _ChatMessages({
    Key? key,
    required this.height,
    required this.chats,
  }) : super(key: key);

  final double height;
  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: height * 0.7,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: chats.length,
        itemBuilder: (context, index) {
          // Get the other user profile
          User user = chats[index].users!.where((user) => user.id != '1').first;
          // Sort the messages based on the creation time
          chats[index]
              .messages!
              .sort((a, b) => b.createdAt.compareTo(a.createdAt));
          // Get the last message for the chat preview
          Message lastMessage = chats[index].messages!.first;

          return ListTile(
            onTap: () {
              Get.toNamed(
                '/chat',
                arguments: [user, chats[index]],
              );
            },
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            title: Text(
              '${user.name} ${user.surname}',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              lastMessage.text,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Text(
              '${lastMessage.createdAt.hour}:${lastMessage.createdAt.minute}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Chats',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: IconTheme.of(context).color,
          ),
          onPressed: () {
            Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            );
            print(IconTheme.of(context).color);
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        width: width * 0.50,
        margin: const EdgeInsets.only(bottom: 30.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withAlpha(150),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {},
                iconSize: 30,
                icon: const Icon(
                  Icons.message_rounded,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {},
                iconSize: 30,
                icon: const Icon(
                  Icons.person_add_rounded,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
