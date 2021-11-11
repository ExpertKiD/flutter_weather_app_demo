extension StringFormat on double {
  String toStringAsFlexibleFraction({int fractionalDigits = 0}) {
    return toStringAsFixed(
        truncateToDouble() == round() ? 0 : fractionalDigits);
  }
}
