import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/user_provider.dart';

class UsersView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userListProvider(context));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('UsersList'), backgroundColor: Colors.white,automaticallyImplyLeading: false,),
      body: usersAsync.when(
        data: (users) => RefreshIndicator(
          onRefresh: () => ref.read(userListProvider(context).notifier).fetchUsers(),
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: Text(user.role),
              );
            },
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
