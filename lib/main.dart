import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/presentation/router/app_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:path_provider/path_provider.dart';
import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'logic/cubit/counter_cubit.dart';
import 'logic/cubit/theme_cubit.dart';
import 'logic/debug/app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory()
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({
    Key key,
  }) : super(key: key);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.counter,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }

}
