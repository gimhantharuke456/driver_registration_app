import 'package:flutter/material.dart';

class NavigationUtil {
  // Private constructor to prevent instantiation
  NavigationUtil._();

  // Navigate to a new screen
  static Future<T?> navigateTo<T>({
    required BuildContext context,
    required String routeName,
    Object? arguments,
    bool replace = false,
    bool removeAll = false,
  }) async {
    if (removeAll) {
      return await Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        (route) => false,
        arguments: arguments,
      );
    }

    if (replace) {
      return await Navigator.pushReplacementNamed(
        context,
        routeName,
        arguments: arguments,
      );
    }

    return await Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  // Pop the current screen
  static void goBack<T>({
    required BuildContext context,
    T? result,
  }) {
    Navigator.pop(context, result);
  }

  // Pop until a specific route
  static void popUntil({
    required BuildContext context,
    required String routeName,
  }) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  // Check if can go back
  static bool canGoBack(BuildContext context) {
    return Navigator.canPop(context);
  }

  // Pop and push a new route
  static Future<T?> popAndPushNamed<T>({
    required BuildContext context,
    required String routeName,
    Object? arguments,
  }) {
    return Navigator.popAndPushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }
}
