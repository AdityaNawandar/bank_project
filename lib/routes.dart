import 'package:bank_project/dashboard.dart';
import 'package:flutter/material.dart';

import 'landing_page.dart';

// Routes
class Routes {
  static Map<String, WidgetBuilder> mapRoutes = {
    "/": (context) => LandingPage(),
    "/dashboard": (context) => Dashboard()
  };
}
