extension StringFormat on double {
  String toStringAsFlexibleFraction({int fractionalDigits = 0}) {
    return this.toStringAsFixed(
        this.truncateToDouble() == this.round() ? 0 : fractionalDigits);
  }
}
