import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnjz_store/Features/home/data/repos/home_repo_impl.dart';
import 'package:mnjz_store/Features/home/presentation/controller/Home%20Cubit/home_cubit.dart';
import 'package:mnjz_store/Features/layout/presentation/controllers/layout_cubit.dart';
import 'package:mnjz_store/Features/layout/presentation/views/widgets/layout_view_body.dart';
import 'package:mnjz_store/core/utils/service_locator.dart';
import 'package:mnjz_store/core/widgets/default_appbar.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: const Scaffold(
        appBar: DefaultAppBar(),
        body: LayoutViewBody(),
      ),
    );
  }
}
