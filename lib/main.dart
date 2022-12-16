import 'package:coffee_shops_santuy/page/coffee_mix/cf_category_screens.dart';
import 'package:coffee_shops_santuy/page/coffee_mix/cf_detail_screens.dart';
import 'package:coffee_shops_santuy/page/coffee_mix/cf_home_screens.dart';
import 'package:coffee_shops_santuy/page/coffee_mix/cf_login_selector_screens.dart';
import 'package:coffee_shops_santuy/page/coffee_mix/cf_navbar.dart';

import 'core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const CfLoginSelectorScreens(),
        '/register': (context) => const CfRegisterScreens(),
        '/login': (context) => const CfLoginScreens(),
        '/navigator': (context) => const CfNavigator(),
        '/home': (context) => CfHomePage(),
        '/category': (context) => CfCategoryPage(),
        '/detail': (context) => CfDetailPage(item: const {}),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const NotFount(),
        );
      },
    );
  }
}
