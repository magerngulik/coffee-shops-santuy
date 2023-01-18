// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:testing_local_storage/bloc/auth/auth_bloc.dart';
import 'package:testing_local_storage/presentation/member/home_user/view/home_user.dart';
import 'package:testing_local_storage/presentation/vendor/navigator/view/navigator.dart';
import 'package:testing_local_storage/util/color/color_util.dart';

class AuthUserFirebase extends StatefulWidget {
  const AuthUserFirebase({Key? key}) : super(key: key);

  @override
  State<AuthUserFirebase> createState() => _AuthUserFirebaseState();
}

class _AuthUserFirebaseState extends State<AuthUserFirebase> {
  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height / 100;
    var lebar = MediaQuery.of(context).size.width / 100;
    AuthBloc authBloc = context.read<AuthBloc>();

    return ConnectivityWidgetWrapper(
      disableInteraction: true,
      offlineWidget: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 250,
                  height: 250,
                  child: Lottie.asset("assets/lottie/no-internet.json")),
              const Text(
                'Hubungkan dengan koneksi internet!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
          body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is Authenticated) {
            if (state.isMember) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeUser()));
            }
            if (state.isVendor) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigatorPage()));
            }
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          bloc: authBloc,
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              // Showing the sign in form if the user is not authenticated
              return Column(
                children: [
                  const SizedBox(
                    height: 150.0,
                  ),
                  Text(
                    "Coffe Santuy",
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 227,
                    width: 271,
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/cfmix/image/illustration.png",
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 109.0,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.w500,
                            color: darkCoffee),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: tinggi * 5,
                    width: lebar * 80,
                    margin: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: darkCoffee),
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder()),
                      onPressed: () {
                        authBloc.add(
                          GoogleSignInRequested(
                              isMember: true, isVendor: false),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/cfmix/image/google.png",
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            "Login as Member",
                            style: TextStyle(
                                color: darkCoffee,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: tinggi * 5,
                    width: lebar * 80,
                    margin: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: darkCoffee),
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder()),
                      onPressed: () {
                        authBloc.add(GoogleSignInRequested(
                            isMember: false, isVendor: true));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/cfmix/image/google.png",
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            "Login as Vendor",
                            style: TextStyle(
                                color: darkCoffee,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      )),
    );
  }
}
