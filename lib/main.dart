import 'package:coffee_shops_santuy/cubit/navmenu_cubit.dart';
import 'package:coffee_shops_santuy/firebase_options.dart';
import 'package:coffee_shops_santuy/page/coffee_app/cfa_navigator.dart';
import 'package:coffee_shops_santuy/page/coffee_mix/cf_category_screens.dart';
import 'package:coffee_shops_santuy/page/coffee_mix/cf_detail_screens.dart';
import 'package:coffee_shops_santuy/page/coffee_mix/cf_home_screens.dart';
import 'package:coffee_shops_santuy/page/coffee_mix/cf_navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NavmenuCubit(),
              ),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: "/",
              routes: {
                '/': (context) => const CfaNavigator(),
                '/register': (context) => const CfRegisterScreens(),
                '/login': (context) => const CfLoginScreens(),
                '/navigator': (context) => const CfNavigator(),
                '/home': (context) => const CfHomePage(),
                '/category': (context) => CfCategoryPage(),
                '/detail': (context) => CfDetailPage(item: const {}),
              },
              onUnknownRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) => const NotFount(),
                );
              },
            ),
          );
        });
  }
}
