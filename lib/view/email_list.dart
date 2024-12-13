import 'package:first_windows/controller/Emailcontroller.dart';
import 'package:first_windows/view/email_details.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';


class EmailListPage extends StatelessWidget {
final title;
   EmailListPage({super.key, this.title});
        final EmailController emailController = Get.put(EmailController());

  @override
  Widget build(BuildContext context) {

    return ScaffoldPage(
      header: PageHeader(
        title:  Text(title),
      ),
      content: Obx(() {
        if (emailController.isLoading.value) {
          return const Center(child: ProgressRing());
        }
        if (emailController.emails.isEmpty) {
          return const Center(child: Text('No emails found.'));
        }
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: emailController.emails.length,
          itemBuilder: (context, index) {
            final email = emailController.emails[index];
            return Padding(
          padding: const EdgeInsets.all(8.0),
              child: Card(
                backgroundColor: Colors.grey.withOpacity(0.1
              ),
                child: ListTile(
                  title: Text(email.subject,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  subtitle: Text(email.snippet),
                  onPressed: () {
                    emailController.fetchEmailDetail(email.id);
                    Navigator.push(
                    context,
                    FluentPageRoute(builder: (context) => EmailDetailPage(emailId: email.id)),
                  );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
