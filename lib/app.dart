import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_local_storage/bloc/auth/auth_bloc.dart';
import 'package:testing_local_storage/bloc/product/product_bloc.dart';
import 'package:testing_local_storage/bloc/random_number/random_number_bloc.dart';
import 'package:testing_local_storage/bloc/user/user_bloc.dart';
import 'package:testing_local_storage/bloc/visible/visible_cubit.dart';
import 'package:testing_local_storage/presentation/auth/auth_user.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget mainview = const NavigatorPage();
    Widget mainview = const AuthUserFirebase();
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => RandomNumberBloc(),
              ),
              BlocProvider(
                create: (context) => ProductBloc(),
              ),
              BlocProvider(
                create: (context) => VisibleCubit(),
              ),
              BlocProvider(
                create: (context) => AuthBloc(),
              ),
              BlocProvider(
                create: (context) => UserBloc(),
              )
            ],
            child: ConnectivityAppWrapper(
              app: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData.light().copyWith(
                      buttonTheme: const ButtonThemeData(
                        buttonColor: Colors.orange,
                      ),
                      appBarTheme: AppBarTheme(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          titleTextStyle: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          iconTheme: const IconThemeData(color: Colors.black))),
                  home: mainview),
            ),
          );
        });
  }
}
