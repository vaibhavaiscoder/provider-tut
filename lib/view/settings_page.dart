import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut/providers/user_provider.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text('Username:'),
                  Text(
                    context.watch<UserProvider>().userName,
                  ),
                  Text(
                    context.watch<UserProvider>().number.toString(),
                  ),
                ],
              ),
              TextField(
                controller: userNameController,
                decoration: const InputDecoration(border: const OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<UserProvider>()
                        .changeUserName(newUserName: userNameController.text);
                    FocusManager.instance.primaryFocus?.unfocus();
                    userNameController.clear();
                  },
                  child: const Text('save'))
            ],
          ),
        ));
  }
}
