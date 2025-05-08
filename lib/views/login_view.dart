import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_keys.dart';
import '../helpers/router_helper.dart';
import '../provider/login_provider.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);

    ref.listen(loginProvider, (prev, next) {
      next.whenOrNull(
        data: (auth) {
          if (auth != null) {
            AppKeys.mainNavigatorKey.currentState?.pushNamed(RouterHelper.counterScreen);
          }
        },
        error: (e, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
          //for now dummy navigation u can use your api call for success case
          AppKeys.mainNavigatorKey.currentState?.pushNamed(RouterHelper.counterScreen);
        },
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ToggleButtons(
              isSelected: [_selectedIndex == 0, _selectedIndex == 1],
              onPressed: (index) => setState(() => _selectedIndex = index),
              children: const [Text("User"), Text("Editor")],
            ),
            TextField(controller: _usernameController, decoration: const InputDecoration(labelText: 'Username')),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 16),
            loginState.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                ref.read(loginProvider.notifier).signIn(
                  _usernameController.text,
                  _passwordController.text,
                  _selectedIndex,
                  context,
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
