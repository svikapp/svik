import 'package:shared_preferences/shared_preferences.dart';
import 'package:svik2/core/error/exceptions.dart';

class CacheHelper {
  final SharedPreferences _prefs;

  CacheHelper(this._prefs);

  Future<String> getToken() async {
    final token = _prefs.getString('token');
    if(token != null){
      return token;
    }
    else{
      throw CacheException();
    }
  }

  Future<void> saveToken(String token) async {
    await _prefs.setString('token', token);
  }

  Future<void> deleteToken()async{
    final isRemoved = await _prefs.remove('token');
    !isRemoved?throw CacheException():null;
  }

  // other helper methods...
}
