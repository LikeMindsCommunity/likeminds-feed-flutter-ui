import 'package:package_info_plus/package_info_plus.dart';

// Return the current package version
Future<String> getFeedUIVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String version = packageInfo.version;

  return version;
}
