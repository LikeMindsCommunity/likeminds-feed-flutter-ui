import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';

import 'package:lm_feed_ui_example/services/callback.dart';
import 'package:lm_feed_ui_example/services/likeminds_service.dart';
import 'package:lm_feed_ui_example/services/service_locator.dart';
import 'package:lm_feed_ui_example/utils/constants/ui_constants.dart';
import 'package:lm_feed_ui_example/views/feed/feed_page.dart';

import 'utils/local_preference/user_local_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initLikeMinds();
  runApp(const FeedUIApp());
}

Future<void> _initLikeMinds() async {
  setupLMFeed(SampleCallback(), "");
  UserLocalPreference.instance.initialize();
  final response = await locator<LikeMindsService>().initiateUser(
    (InitiateUserRequestBuilder()
          ..userId('flutter_ui_test_user')
          ..userName('Flutter UI Test User'))
        .build(),
  );
  if (response.success) {
    final user = response.initiateUser?.user;
    // LMFeed._instance!.deepLinkCallBack();
    UserLocalPreference.instance.storeUserData(user!);
  }
  return Future<void>.value();
}

class FeedUIApp extends StatelessWidget {
  const FeedUIApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const FeedScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:
//           Theme.of(context).colorScheme.inversePrimary.withAlpha(205),
//       appBar: AppBar(
//         backgroundColor: kWhiteColor,
//         centerTitle: false,
//         title: Text("UI Widgets example",
//             textAlign: TextAlign.start,
//             style: TextStyle(
//               color: Theme.of(context).colorScheme.primary,
//               fontWeight: FontWeight.bold,
//             )),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               LMPostWidget(),
//               SizedBox(height: 16),
//               LMPostWidget(),
//               Spacer(),
//             ],
//           ),
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _incrementCounter,
//       //   tooltip: 'Increment',
//       //   child: const Icon(Icons.add),
//       // ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
