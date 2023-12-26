import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mnjz_store/Features/home/presentation/controller/Home%20Cubit/home_cubit.dart';
import 'package:mnjz_store/bloc_observer.dart';
import 'package:mnjz_store/core/database/database_helper.dart';
import 'package:mnjz_store/core/network/connectivity_service.dart';
import 'package:mnjz_store/core/themes/color_manager.dart';
import 'package:mnjz_store/core/utils/app_router.dart';
import 'package:mnjz_store/core/utils/service_locator.dart';

import 'Features/home/data/repos/home_repo_impl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator(); // Initialize the service locator
  // Initialize the database
  await sl.get<DatabaseHelper>().initializeDatabase();

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        sl.get<HomeRepoImpl>(),
        sl.get<ConnectivityService>(),
      )..fetchProductsCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            theme: ThemeData(scaffoldBackgroundColor: ColorManager.white),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
