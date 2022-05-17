import 'package:flutter/material.dart';
import 'package:kf_survey/util/const.dart';
import 'package:stacked/stacked.dart';

import 'splash_vm.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "KF Survey",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      mediumPaddingVertical,
                      CircularProgressIndicator(),
                    ]),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.initialise(),
    );
  }
}
