class ApiConstant {
  /// Base URL for the API endpoints.
  ///
  /// iOS Simulator / same machine: use [simulatorBaseUrl].
  /// Physical device on same Wi‑Fi: use [deviceBaseUrl] and run:
  /// `php artisan serve --host=0.0.0.0 --port=8000`
  static const String simulatorBaseUrl = 'http://127.0.0.1:8000/api/';
  static const String deviceBaseUrl = 'http://192.168.1.4:8000/api/';

  static const String baseUrl = simulatorBaseUrl;

  /// Base URL for Laravel's public storage (served by `php artisan storage:link`).
  /// Files are accessible at `storageBaseUrl`/`filename`.
  static const String _simulatorStorageBaseUrl =
      'http://127.0.0.1:8000/storage/profiles/';
  static const String _deviceStorageBaseUrl =
      'http://192.168.1.4:8000/storage/profiles/';

  static String get storageBaseUrl => baseUrl == simulatorBaseUrl
      ? _simulatorStorageBaseUrl
      : _deviceStorageBaseUrl;

  /// Resolves a raw [path] returned by the backend into a full, valid public URL
  /// using [storageBaseUrl] as the canonical host.
  ///
  /// Problems handled:
  ///   1. Backend embeds its own loopback host (`127.0.0.1`) in the URL —
  ///      unreachable from a physical device.  We strip the host and rebuild.
  ///   2. Broken traversal path (`http://host/storage/../../storage/app/public/file`)
  ///      also fixed by the same rewrite.
  ///   3. Raw relative paths (`storage/app/public/file` or `../../storage/app/public/file`)
  ///      → `<storageBaseUrl><file>`
  ///   4. Bare filename fallback → `<storageBaseUrl><filename>`
  static String resolveStorageUrl(String path) {
    const storageSegment = '/storage/profiles/';
    const rawMarker = 'storage/app/public/profiles/';

    // ── Full URL (http:// or https://) ───────────────────────────────────────
    if (path.startsWith('http://') || path.startsWith('https://')) {
      // Extract everything after the first '/storage/profiles/' segment and rebuild
      // with our canonical storageBaseUrl.
      final storageIndex = path.indexOf(storageSegment);
      if (storageIndex != -1) {
        final pathAfterStorage = path.substring(
          storageIndex + storageSegment.length,
        );

        // If the extracted path still has a raw marker (edge case), unwrap it.
        final markerIndex = pathAfterStorage.indexOf(rawMarker);
        if (markerIndex != -1) {
          return storageBaseUrl +
              pathAfterStorage.substring(markerIndex + rawMarker.length);
        }
        return storageBaseUrl + pathAfterStorage;
      }

      // Legacy fallback: if it has '/storage/' segment but not '/storage/profiles/'
      final legacyStorageIndex = path.indexOf('/storage/');
      if (legacyStorageIndex != -1) {
        final pathAfterLegacy = path.substring(
          legacyStorageIndex + '/storage/'.length,
        );
        if (pathAfterLegacy.startsWith('profiles/')) {
          return storageBaseUrl + pathAfterLegacy.substring('profiles/'.length);
        }
        return storageBaseUrl + pathAfterLegacy;
      }

      // No storage segment at all — return unchanged.
      return path;
    }

    // ── Relative path ─────────────────────────────────────────────────────────
    final normalised = path.replaceAll('\\', '/');

    // Find 'storage/app/public/profiles/' anywhere in the relative path.
    final markerIndex = normalised.indexOf(rawMarker);
    if (markerIndex != -1) {
      return storageBaseUrl +
          normalised.substring(markerIndex + rawMarker.length);
    }

    // Find legacy 'storage/app/public/' anywhere in the relative path.
    final rawMarkerLegacyIndex = normalised.indexOf('storage/app/public/');
    if (rawMarkerLegacyIndex != -1) {
      final pathAfterMarker = normalised.substring(
        rawMarkerLegacyIndex + 'storage/app/public/'.length,
      );
      if (pathAfterMarker.startsWith('profiles/')) {
        return storageBaseUrl + pathAfterMarker.substring('profiles/'.length);
      }
      return storageBaseUrl + pathAfterMarker;
    }

    // Fallback: use the bare filename (last non-empty path segment).
    final filename = normalised.split('/').where((s) => s.isNotEmpty).last;
    return storageBaseUrl + filename;
  }
}
