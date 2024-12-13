import 'package:first_windows/controller/Emailcontroller.dart';
import 'package:first_windows/view/email_list.dart';
import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

void main() {
  runApp(FluentMailApp());
}

class FluentMailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Fluent Mail',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = Get.put(EmailController());
            emailController.fetchEmails();
    return FluentApp(
      title: 'Flutter Mail',
      themeMode: ThemeMode.system,
  
      debugShowCheckedModeBanner: false,
     home: Obx(() {
        return NavigationView(
          appBar: NavigationAppBar(
            title: const Text(
              'Flutter Mail',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          // Define the pane (navigation)
          pane: NavigationPane(
            selected: emailController.selectedIndex.value, // Bind selected index to controller
            onChanged: (index) {
              emailController.setSelectedIndex(index); // Update selected index
            },
            displayMode: PaneDisplayMode.open,
            items: [
              PaneItem(
                icon: const Icon(FluentIcons.inbox),
                infoBadge: Badge.count(count: 11),
                enabled: true,
                title: const Text('Inbox'),
                body: EmailListPage(title: 'Inbox'),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.profile_search),
                title: const Text('Profile'),
                body: EmailListPage(title: 'Profile'),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.send),
                title: const Text('Sent'),
                body: EmailListPage(title: 'Sent'),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.skype_message),
                title: const Text('Spam'),
                body: EmailListPage(title: 'Spam'),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.settings),
                title: const Text('Settings'),
                infoBadge: Badge(),
                body: EmailListPage(title: 'Settings'),
              ),
            ],
          ),
          // Dynamically update the body based on the selected pane
          //content: _getPageContent(emailController.selectedIndex.value),
        );
      }),
    );
  }
  // This function returns the correct body based on selected index
  Widget _getPageContent(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return EmailListPage(title: 'Inbox');
      case 1:
        return EmailListPage(title: 'Profile');
      case 2:
        return EmailListPage(title: 'Sent');
      case 3:
        return EmailListPage(title: 'Spam');
      case 4:
        return EmailListPage(title: 'Settings');
      default:
        return EmailListPage(title: 'Inbox');
    }
  }

}