import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityController {
  final Function(bool) onCompletion;
  const ConnectivityController({required this.onCompletion});

  Future<void> isConected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      onCompletion(false);
    } else {
      onCompletion(true);
    }
  }
}
