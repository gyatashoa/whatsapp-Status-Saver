import 'package:permission_handler/permission_handler.dart';

class Perms{
  static Future<bool> getPerms ()async{
      var perm = await Permission.storage.request();
      return perm.isGranted;
  }
}