import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  Widget _getAppBarAction(
    String actionLabel,
    String destinationUrl,
    BuildContext context,
  ) {
    return Center(
      child: TextButton(
        style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
        ),
        onPressed: () {
          context.go(destinationUrl);
        },
        child: Text(
          actionLabel,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: destinationUrl == GoRouterState.of(context).location
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      forceMaterialTransparency: true,
      actions: [
        _getAppBarAction('Home', '/', context),
        const Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.1,
          ),
        ),
        _getAppBarAction('Experience', '/experience', context),
        const Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.1,
          ),
        ),
        _getAppBarAction('About Me', '/about-me', context),
        const Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.1,
          ),
        ),
      ],
    );
  }
}
