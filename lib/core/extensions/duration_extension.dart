extension DurationExtension on Duration {
  String toMMSS() {
    final int seconds = inSeconds % 60;
    return '${inMinutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
