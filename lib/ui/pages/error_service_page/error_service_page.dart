part of '../../../ice_flutter_toolkit.dart';

class ErrorServiceWidget extends StatefulWidget {
  const ErrorServiceWidget({super.key, required this.child});
  final Widget child;

  @override
  State<ErrorServiceWidget> createState() => ErrorServicePageState();
}

class ErrorServicePageState extends State<ErrorServiceWidget> {
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
    return widget.child;
    // return const Scaffold(
    //   backgroundColor: AppColors.white,
    //   body: AutoRouter(),
    // );
  }
}
