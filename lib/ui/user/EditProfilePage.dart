import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;

  EditProfilePage({
    super.key,
    required String currentUsername,
    required String currentEmail,
  })  : usernameController = TextEditingController(text: currentUsername),
        emailController = TextEditingController(text: currentEmail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa hồ sơ'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tên người dùng
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Tên người dùng',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Email
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Nút lưu
            ElevatedButton(
              onPressed: () {
                String updatedUsername = usernameController.text;
                String updatedEmail = emailController.text;

                Navigator.pop(context, {
                  'username': updatedUsername,
                  'email': updatedEmail,
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Lưu thay đổi'),
            ),
          ],
        ),
      ),
    );
  }
}
