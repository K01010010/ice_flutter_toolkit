import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ice_flutter_toolkit/ui/pages/error_service_page/error_service.dart';
import 'package:ice_flutter_toolkit/utils/app_colors.dart';
import 'package:mobx/mobx.dart';

@RoutePage()
class ErrorServicePage extends StatefulWidget {
  const ErrorServicePage({super.key});

  @override
  State<ErrorServicePage> createState() => _ErrorServicePageState();
}

class _ErrorServicePageState extends State<ErrorServicePage> {
  final ErrorService service = ErrorService.get();

  final List<ReactionDisposer> _disposers = [];

  @override
  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers.add(reaction(
      //fireImmediately: true,
      (_) => service.errorMessage != null,
      (_) {
        if (service.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.primary437,
              duration: service.showingDuration ?? const Duration(milliseconds: 3000),
              content: Text(
                service.errorMessage ?? "Произошла ошибка",
                style: const TextStyle(
                  fontFamily: 'Golos',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          );
          service.showingDuration = null;
          service.errorMessage = null;
        }
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: AutoRouter(),
    );
  }
}
