import 'package:flutter/material.dart';
import 'package:untitled2/data/user_repository.dart';

import '../data/user.dart';
import 'card_widget.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key, required this.title});

  final String title;
  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  final _userRepository = UserRepository(); //конструируем объект

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder<List<User>>(
            //рез-т выполнения future будет иметь тип данных list user
            future: _userRepository.getUsers(), //вызыаем ассинхр. метод
            builder: (_, snapshot) {
              // присваивается коллбек - снэпшот
              //snapshot - рез-т выполнения future (обёртка)
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final items = snapshot.data as List<User>; // приводим к не-null
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                  child: ListView.separated(
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/cardDetail',
                                arguments: items[index]);
                          },
                          child: CardWidget(user: items[index]),
                        ), //кладем каждого юзера из списка юзеров
                      );
                    },
                    separatorBuilder: (_, int index) {
                      return const SizedBox(height: 8);
                    },
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator()); //spinner
            }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
