// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chat_test/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}


//MaterialApp(
//       home: BlocProvider(
//         create: (context) => MainBloc(),
//         child: BlocBuilder<MainBloc, MainState>(
//           builder: (context, state) {
//             return Scaffold(
//               appBar: AppBar(
//                 backgroundColor: Colors.blue,
//                 actions: [
//                   IconButton(
//                       onPressed: () {
//                         context.read<MainBloc>().add(GetUserChatEvent());
//                       },
//                       icon: const Icon(Icons.refresh))
//                 ],
//               ),
//               body: ListView.separated(
//                 reverse: true,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 5,
//                 ),
//                 itemBuilder: (_, index) => SizedBox(
//                   width: double.infinity,
//                   child: Row(
//                     mainAxisAlignment:
//                         (state.massageList?.toList()[index].minemassage ??
//                                 false)
//                             ? MainAxisAlignment.end
//                             : MainAxisAlignment.start,
//                     children: [
//                       Ink(
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                             color: Colors.lightBlue.shade200,
//                           ),
//                           padding: const EdgeInsets.all(15),
//                           child: Text(
//                               state.massageList?.toList()[index].massage ??
//                                   "error"))
//                     ],
//                   ),
//                 ),
//                 separatorBuilder: (_, __) => const SizedBox(
//                   height: 10,
//                 ),
//                 itemCount: state.massageList?.length ?? 0,
//               ),
//               bottomNavigationBar: SafeArea(
//                 minimum: const EdgeInsets.all(5),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: controller,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           context
//                               .read<MainBloc>()
//                               .add(SetUserEvent(userName: controller.text));
//                         },
//                         icon: const Icon(Icons.send))
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     )