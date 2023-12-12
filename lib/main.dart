import 'package:chat/pages/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat/pages/chat_padge.dart';
import 'package:chat/pages/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat/pages/cubits/login_cubit/login_cubit.dart';
import 'package:chat/pages/cubits/register_cubit/register_cubit.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = SimpleBlocObserver();
  runApp(
    ChatApp(),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        routes: {
          'LoginPage': (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
