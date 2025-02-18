import 'package:device_info_plus/device_info_plus.dart';

/// Utility to resolve the OS version for the supported platforms iOS & Android
class VersionResolver {
  /// Resolves the OS version using [DeviceInfoPlugin]
  const VersionResolver(this._plugin);

  final DeviceInfoPlugin _plugin;

  /// Returns the sdkInt for android
  Future<int> getAndroidSDKVersion() async {
    final info = await _plugin.androidInfo;
    return info.version.sdkInt;
  }

  /// Returns the mayor release of the current iOS version
  Future<int> getIOSVersion() async {
    final info = await _plugin.iosInfo;
    final mayorRelease = info.systemVersion.split(".").first;
    return int.parse(mayorRelease);
  }
}
