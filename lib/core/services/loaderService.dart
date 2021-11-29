import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class Loader {
  void show({required String message});
  void dismiss();
}

class LoaderService implements Loader {
  @override
  void dismiss() {
    EasyLoading.dismiss();
  }

  @override
  void show({required String message}) {
    EasyLoading.show(status: message);
  }
}
