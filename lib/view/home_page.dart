import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut/providers/user_provider.dart';
import 'package:provider_tut/repository/user_repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).getUserDetails();
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) => Scaffold(
        appBar: appBarHome(userProvider),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingHome(userProvider),
        body: userProvider.userData == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: userProvider.userData!.data.length,
                itemBuilder: ((context, index) {
                  final user = userProvider.userData!.data[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email),
                  );
                })),
      ),
    );
  }


  Padding floatingHome(UserProvider userProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () {
              userProvider.incrementNumber();
            },
            child: const Icon(Icons.add),
          ),
          ElevatedButton(onPressed: (){
            UserApi.createUser('vaibhava', 'gp');
          }, child: const Text('Add user')),
          FloatingActionButton(
            onPressed: () {
              userProvider.decrementNumber();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  AppBar appBarHome(UserProvider userProvider) {
    return AppBar(
      title: const Text(
        'Home',
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                userProvider.userName,
              ),
              Text(
                userProvider.number.toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
