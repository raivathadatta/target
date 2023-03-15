import 'package:injectable/injectable.dart';
import 'package:open_settings/open_settings.dart';

import 'package:permission_handler/permission_handler.dart';

// model class
class PermissionInstance {
  bool isPermanentDenied;
  bool isDenied;
  bool isGranted;
  bool isRestricted;

  PermissionInstance(
      {this.isGranted = false,
      this.isDenied = false,
      this.isRestricted = false,
      this.isPermanentDenied = false});
}

abstract class PermissionServices {
  Future<PermissionInstance> checkCameraPermission();
  Future<PermissionInstance> checkVideoPermission();
  Future<PermissionInstance> checkFilePermission();
  Future<PermissionInstance> checkMicroPhonePermission();
  Future<PermissionInstance> _getPermissionStatus(Permission permission);
  void openAppSetting();
}

@LazySingleton(as: PermissionServices)
class PermissionServiceImpl implements PermissionServices {
  const PermissionServiceImpl();

  @override
  Future<PermissionInstance> checkCameraPermission() async {
    return await _getPermissionStatus(Permission.camera);
  }

  Future<PermissionInstance> checkVideoPermission() async {
    return await _getPermissionStatus(Permission.videos);
  }

  @override
  Future<PermissionInstance> checkFilePermission() async {
    return await _getPermissionStatus(Permission.manageExternalStorage);
  }

  @override
  Future<PermissionInstance> checkMicroPhonePermission() async {
    return _getPermissionStatus(Permission.microphone);
  }

  @override
  Future<PermissionInstance> _getPermissionStatus(Permission permission) async {
    bool isStatusDenied = await permission.isDenied;
    bool grantstatus = await permission.isGranted;
    if (isStatusDenied) {
      PermissionStatus requestStatus = await permission.request();
      if (requestStatus.isGranted) {
        return PermissionInstance(isGranted: true);
      } else if (requestStatus.isPermanentlyDenied) {
        return PermissionInstance(isPermanentDenied: true);
      } else if (requestStatus.isRestricted) {
        return PermissionInstance(isRestricted: true);
      } else if (requestStatus.isDenied) {
        return PermissionInstance(isDenied: true);
      }
    } else if (grantstatus) {
      return PermissionInstance(isGranted: true);
    }
    return PermissionInstance(isGranted: true);
  }

  void openAppSetting() {
    OpenSettings.openAppSetting();
  }
}
