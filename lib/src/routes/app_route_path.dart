enum AppRoute {
  home(path: '/'),
  postList(path: '/postList'),
  customInput(path: '/customInput');

  final String path;
  const AppRoute({required this.path});
}
