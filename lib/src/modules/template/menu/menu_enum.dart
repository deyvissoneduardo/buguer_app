enum Menu {
  products(
    '/products/home',
    'product_ico.png',
    'product_ico_selected.png',
    'Administrar Produtos',
  ),
  setup(
    '/setup',
    'order_ico.png',
    'order_ico_selected.png',
    'App',
  );

  final String route;
  final String assetIcon;
  final String assetIconSelected;
  final String label;

  const Menu(
    this.route,
    this.assetIcon,
    this.assetIconSelected,
    this.label,
  );

  static Menu? findByPath(String path) {
    final menu = Menu.values.where((element) => path.contains(element.route));

    if (menu.isNotEmpty) {
      return menu.first;
    }
    return null;
  }
}
