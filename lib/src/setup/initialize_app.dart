import 'package:demo_app/src/setup/api.dart';
import 'package:demo_app/src/setup/di.dart';

void initializeApp() {
  setupDependencies();
  configureApi();
}
