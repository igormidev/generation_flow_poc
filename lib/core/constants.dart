class Constants {
  static Constants? _instance;
  // Avoid self instance
  Constants._();
  static Constants get i => _instance ??= Constants._();

  final Lotties lottie = Lotties();
}

class Lotties {
  static const String _prefix = 'assets/lottie';
  final String configurations = '$_prefix/configurations.json';
  final String imagination = '$_prefix/imagine.json';
  final String doubleArrow = '$_prefix/double_arrow.json';
}
