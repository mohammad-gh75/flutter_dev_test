import 'package:flutter/material.dart';

import 'core/theme/app_themes.dart';
import 'features/custom_input/presentation/pages/custom_input_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
      child: SafeArea(
        child: MaterialApp(
          title: 'flutter dev test',
          locale: const Locale('en', 'US'),
          themeMode: ThemeMode.light,
          theme: theme(),
          debugShowCheckedModeBanner: false,
          home: const CustomInput(),
        ),
      ),
    );
  }
}
