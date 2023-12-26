import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/generated/assets.dart';
import 'package:flutter_common_demo/page_route_builder/page_flip/page_flip_builder.dart';
import 'app_assets.dart';

class PageFlipDemo1 extends StatelessWidget {
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  PageFlipDemo1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: PageFlipHomePage1(),
    );
  }
}

class PageFlipHomePage1 extends StatelessWidget {
  PageFlipHomePage1({super.key});

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: PageFlipBuilder(
        key: pageFlipKey,
        frontBuilder: (_) => LightHomePage(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
        backBuilder: (_) => DarkHomePage(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
        maxTilt: 0.003,
        maxScale: 0.2,
        onFlipComplete: (isFrontSide) => debugPrint('front: $isFrontSide'),
      ),
    );
  }
}

class LightHomePage extends StatelessWidget {
  const LightHomePage({super.key, this.onFlip});
  final VoidCallback? onFlip;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          brightness: Brightness.light,
          textTheme: TextTheme(
            displaySmall: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
          )),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: kIsWeb
              ? BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5),
                )
              : null,
          child: Column(
            children: [
              const Spacer(),
              Image.asset(Assets.assetsMds),
              const Spacer(),
              BottomFlipIconButton(onFlip: onFlip),
            ],
          ),
        ),
      ),
    );
  }
}

class DarkHomePage extends StatelessWidget {
  const DarkHomePage({super.key, this.onFlip});
  final VoidCallback? onFlip;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(
            displaySmall: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          )),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: kIsWeb
              ? BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5),
                )
              : null,
          child: Column(
            children: [
              const Spacer(),
              Image.asset(Assets.assetsXyx),
              const Spacer(),
              BottomFlipIconButton(onFlip: onFlip),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionsDrawer extends StatelessWidget {
  const OptionsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer();
  }
}

class BottomFlipIconButton extends StatelessWidget {
  const BottomFlipIconButton({super.key, this.onFlip});
  final VoidCallback? onFlip;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onFlip,
          icon: const Icon(Icons.flip),
        )
      ],
    );
  }
}
