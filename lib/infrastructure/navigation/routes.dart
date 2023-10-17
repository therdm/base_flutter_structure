part of 'navigation.dart';

class Routes {
  Routes._(this.context);

  factory Routes.of(BuildContext context) => Routes._(context);
  final BuildContext context;

  void toLocationSampleModule() => context.go('/${RoutePath.sampleModule}');

  void toNamedSampleModule() => context.goNamed(RoutePath.sampleModule);

  void toInitializer() => context.go('/');
}

class RoutePath {
  static const initializer = '/';
  static const sampleModule = 'sample_module';
}
