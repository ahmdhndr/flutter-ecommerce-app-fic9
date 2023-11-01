import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic9_ecommerce_app/common/components/button.dart';
import 'package:flutter_fic9_ecommerce_app/common/components/custom_text_field.dart';
import 'package:flutter_fic9_ecommerce_app/common/components/space_height.dart';
import 'package:flutter_fic9_ecommerce_app/common/constants/images.dart';
import 'package:flutter_fic9_ecommerce_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/requests/login_request_model.dart';
import 'package:flutter_fic9_ecommerce_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_fic9_ecommerce_app/presentation/auth/register_page.dart';
import 'package:flutter_fic9_ecommerce_app/presentation/dashboard/dashboard_page.dart';

import '../../common/constants/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const SpaceHeight(80.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130.0),
            child: Image.asset(
              Images.logo,
              width: 200,
              height: 200,
            ),
          ),
          const SpaceHeight(24.0),
          const Center(
            child: Text(
              'E-Commerce App FIC 9 Achmad Hendarsyah',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: ColorName.dark,
              ),
            ),
          ),
          const SpaceHeight(8.0),
          const Center(
            child: Text(
              'Masuk untuk melanjutkan',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: ColorName.grey,
              ),
            ),
          ),
          const SpaceHeight(40.0),
          CustomTextField(
            controller: emailController,
            label: 'Email',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SpaceHeight(24.0),
          BlocConsumer<LoginBloc, LoginState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Button.filled(
                    onPressed: () {
                      final data = LoginRequestModel(
                        identifier: emailController.text,
                        password: passwordController.text,
                      );
                      context.read<LoginBloc>().add(LoginEvent.login(data));
                    },
                    label: 'Masuk',
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (data) async {
                  AuthLocalDatasource().saveAuthData(data);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardPage(),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Berhasil masuk!'),
                      backgroundColor: ColorName.green,
                    ),
                  );
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: ColorName.red,
                    ),
                  );
                },
              );
            },
          ),
          const SpaceHeight(122.0),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text.rich(
                TextSpan(
                  text: 'Belum punya akun? ',
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Register',
                      style: TextStyle(color: ColorName.primary),
                    )
                  ],
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    color: ColorName.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
