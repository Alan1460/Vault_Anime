// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:paginas/controller/auth_controller.dart';
import 'package:paginas/controller/chat_controller.dart';
import 'package:paginas/data/model/message.dart';
import 'package:paginas/widgets/chat_page.dart';

class MockChatController extends GetxService
    with Mock
    implements ChatController {
  @override
  var messages = <Message>[].obs;
  @override
  Future<void> sendMsg(String text) async {
    messages.add(Message('key', text, '001'));
  }
}

class MockAuthenticationController extends GetxService
    with Mock
    implements AuthController {
  @override
  String getUid() {
    return '001';
  }
}

void main() {
  setUp(() {
    MockAuthenticationController mockAuthenticationController =
        MockAuthenticationController();
    Get.put<AuthController>(mockAuthenticationController);

    MockChatController mockChatController = MockChatController();
    Get.put<ChatController>(mockChatController);
  });
  testWidgets('Simple chat test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: ChatPage(),
    )));

    await tester.pump();

    await tester.enterText(find.byKey(const Key('MsgTextField')), 'Juan');

    await tester.tap(find.byKey(const Key('sendButton')));

    await tester.pump();

    expect(find.text('Juan'), findsOneWidget);
  });
}
