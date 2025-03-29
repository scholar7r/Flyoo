import 'package:shared_preferences/shared_preferences.dart';

/// Provides an asynchronous access interface to [SharedPreferences]
/// 
/// This class wraps [SharedPreferences], allowing access via [Future] or
/// [Stream], making it useful for scenarios where listening stored data for
/// changes is needed.
class SharedPreferencesProvider {
  final Future<SharedPreferences> sharedPreferences;

  SharedPreferencesProvider(this.sharedPreferences);

  Stream<SharedPreferences> get prefsState => sharedPreferences.asStream();
}
