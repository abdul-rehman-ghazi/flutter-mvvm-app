import 'package:demo_app/src/ui/screen/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({super.key});

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();

  @override
  void onViewModelReady(SplashViewModel viewModel) {
    viewModel.onViewModelReady();
  }

  @override
  Widget builder(
    BuildContext context,
    SplashViewModel viewModel,
    Widget? child,
  ) =>
      Column(
        children: [
          Flexible(
            child: Center(
              child: Image.asset('assets/icons/logo.png'),
            ),
          ),
        ],
      );
}
