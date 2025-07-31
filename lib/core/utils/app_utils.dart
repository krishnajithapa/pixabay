class AppUtils {
  static String formatFileSize(int bytes) {
    if (bytes < 1000) {
      return bytes.toString();
    } else if (bytes < 1000000) {
      // Less than 1M, show K with one decimal if needed
      double kb = bytes / 1000;
      return (kb % 1 == 0) ? '${kb.toInt()}K' : '${kb.toStringAsFixed(1)}K';
    } else if (bytes < 1000000000) {
      // Less than 1GB, show M with one decimal if needed
      double mb = bytes / 1000000;
      return (mb % 1 == 0) ? '${mb.toInt()}M' : '${mb.toStringAsFixed(1)}M';
    } else {
      // 1GB or more, show GB with one decimal if needed
      double gb = bytes / 1000000000;
      return (gb % 1 == 0) ? '${gb.toInt()}GB' : '${gb.toStringAsFixed(1)}GB';
    }
  }
}
