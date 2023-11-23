String capitalize(String s) {
  if (s.length < 2) {
    return s.toUpperCase();
  }
  return s[0].toUpperCase() + s.substring(1);
}

String toCamelCase(String s) {
  if (s.length < 2) {
    return s.toLowerCase();
  }
  return s[0].toLowerCase() + s.substring(1);
}
