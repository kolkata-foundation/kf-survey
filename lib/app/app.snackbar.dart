import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';

enum SnackbarType { info, error, success }

void setupSnackbarUi() {
  final SnackbarService snackbarService = locator.get<SnackbarService>();
  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.greenAccent,
      textColor: Colors.white,
    ),
  );
  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.info,
    config: SnackbarConfig(
      backgroundColor: Colors.blueAccent,
      textColor: Colors.black12,
    ),
  );
  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
    ),
  );
}
