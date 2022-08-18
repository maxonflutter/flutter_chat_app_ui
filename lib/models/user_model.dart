class User {
  final String id;
  final String name;
  final String surname;
  final String imageUrl;

  const User({
    required this.id,
    required this.name,
    required this.surname,
    required this.imageUrl,
  });

  static const List<User> users = [
    User(
      id: '1',
      name: 'John',
      surname: 'Whitaker',
      imageUrl:
          'https://images.unsplash.com/photo-1657299143322-934f44698807?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
    ),
    User(
      id: '2',
      name: 'Alex',
      surname: 'Brown',
      imageUrl:
          'https://images.unsplash.com/photo-1659661234411-1c3605f2cf3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1292&q=80',
    ),
    User(
      id: '3',
      name: 'Lisa',
      surname: 'Jones',
      imageUrl:
          'https://images.unsplash.com/photo-1659798513836-be95d1321735?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80',
    ),
    User(
      id: '4',
      name: 'Anthony',
      surname: 'Jones',
      imageUrl:
          'https://images.unsplash.com/photo-1657299141984-dd9196274cde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    ),
    User(
      id: '5',
      name: 'Kathy',
      surname: 'Ball',
      imageUrl:
          'https://images.unsplash.com/photo-1659788496199-01c0436a16f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1319&q=80',
    ),
    User(
      id: '6',
      name: 'Mark',
      surname: 'Lost',
      imageUrl:
          'https://images.unsplash.com/photo-1659763708148-71eaeee1101e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
    ),
  ];
}
