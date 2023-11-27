/// Extension method that allows folding over a pair of values.
/// The `fold` method takes two functions as arguments: `left` and `right`.
/// If the first value of the pair is `null`, the `right` function is called with the second value.
/// Otherwise, the `left` function is called with the first value.
/// The result of the function call is returned.
extension RecordExtension<L, R> on (L?, R?) {
  E fold<E>(E Function(L? l) left, E Function(R r) right) {
    if (this.$1 == null) {
      return right(this.$2 as R);
    } else {
      return left(this.$1);
    }
  }
}

/// Creates a pair with the first value set to `null` and the second value set to the provided `right` value.
(L?, R?) right<L, R>(R? right) {
  return (null, right);
}

/// Creates a pair with the first value set to the provided `left` value and the second value set to `null`.
(L?, R?) left<L, R>(L? left) {
  return (left, null);
}
