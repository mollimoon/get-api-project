

import 'package:flutter/material.dart';
import 'package:untitled2/data/user_repository.dart';

import '../data/user.dart';
import 'card_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _userRepository = UserRepository(); //конструируем объект


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder<List<User>>( //рез-т выполнения future будет иметь тип данных list user
            future: _userRepository.getUsers(), //вызыаем метод
            builder: (_, snapshot) {
              //snapshot - рез-т выполнения future (обёртка)
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                final items = snapshot.data as List<User>;

                return ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CardWidget(user: items[index]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 8);
                  },
                );
              }

              return const Center(child: CircularProgressIndicator()); //spinner
            }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
