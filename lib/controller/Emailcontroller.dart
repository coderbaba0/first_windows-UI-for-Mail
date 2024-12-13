import 'package:first_windows/model/model.dart';
import 'package:first_windows/service/emai_service.dart';
import 'package:get/get.dart';


class EmailController extends GetxController {
  var emails = <Email>[].obs;
  var isLoading = false.obs;
  var selectedEmail = Rxn<Email>();
var selectedIndex = 0.obs;
void setSelectedIndex(int index) {
    selectedIndex.value = index; // Update the selected index
  }
  Future<void> fetchEmails() async {
    isLoading.value = true;
    try {
      final fetchedEmails = await EmailService.fetchEmails();
      emails.assignAll(fetchedEmails);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchEmailDetail(String id) async {
    isLoading.value = true;
    try {
      final email = await EmailService.fetchEmailDetail(id);
      selectedEmail.value = email;
    } finally {
      isLoading.value = false;
    }
  }
}
