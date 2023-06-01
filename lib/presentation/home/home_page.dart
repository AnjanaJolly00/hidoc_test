import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/presentation/home/home_mobile.dart';
import '../../bloc/home_cubit.dart';
import '../../bloc/state/home_cubit_state.dart';
import '../../utils/app_colors.dart';
import '../../widgets/app_loader.dart';
import '../../widgets/responsive_layout.dart';
import 'home_desktop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenCubit cubit = HomeScreenCubit();

  AppLoader loader = AppLoader();

  @override
  void initState() {
    cubit = context.read<HomeScreenCubit>();
    cubit.getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenCubit, HomeScreenState>(
      listener: ((context, state) {
        if (state is HomeScreenLoadingState) {
          loader.show(context);
        }

        if (state is HomeScreenFailureState) {
          BotToast.showText(text: state.errorMsg);
        }
        loader.hide(context);
      }),
      bloc: BlocProvider.of<HomeScreenCubit>(context),
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
        if (state is HomeScreenSuccessState) {
          return Scaffold(
              backgroundColor: backgroundColor,
              body: ResponsiveLayout(
                  tabBody: HomeMobile(cubit: cubit),
                  desktopBody: HOmeWeb(
                    cubit: cubit,
                  ),
                  mobileBody: HomeMobile(cubit: cubit)));
        }
        if (state is HomeScreenLoadingState) {
          return const Scaffold(
            backgroundColor: backgroundColor,
            body: Center(
              child: CircularProgressIndicator(strokeWidth: 1),
            ),
          );
        }
        loader.hide(context);
        return Scaffold(
          body: Container(),
        );
      }),
    );
  }
}
