import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newjarvis/components/route_controller.dart';
import 'package:newjarvis/firebase_options.dart';
import 'package:newjarvis/providers/auth_provider.dart';
import 'package:newjarvis/states/category_state.dart';
import 'package:newjarvis/states/chat_state.dart';
import 'package:newjarvis/states/prompts_state.dart';
import 'package:newjarvis/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider(context)),
        ChangeNotifierProvider(create: (context) => ChatState()),
        ChangeNotifierProvider(create: (context) => PromptState()),
        ChangeNotifierProvider(create: (context) => CategoryState()),
      ],
      child: MaterialApp(
        title: 'New Jarvis',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        navigatorKey: RouteController.navigatorKey,
        initialRoute: RouteController.auth,
        onGenerateRoute: RouteController.generateRoute,
      ),
    );
  }
}
