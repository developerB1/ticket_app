import 'package:get/get.dart';

class TextExpensionController extends GetxController {
  var isExpanded = false.obs;
  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
}
