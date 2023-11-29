/// {@template cache_client}
/// An in-memory cache client.
///
/// Warning :: This used for just a value that you want to use during user session.
///             it is not Persistent Local Storage it is in-memory "RAM" storage.
///
/// {@endtemplate}
class CacheClient {
  CacheClient() : _cache = <String, Object>{};

  final Map<String, Object> _cache;

  /// Writes the provide [key], [value] pair to the in-memory cache.
  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  /// Looks up the value for the provided [key].
  /// Defaults to `null` if no value exists for the provided key.
  T? read<T extends Object>({required String key}) {
    final Object? value = _cache[key];
    if (value is T) return value;
    return null;
  }
}
