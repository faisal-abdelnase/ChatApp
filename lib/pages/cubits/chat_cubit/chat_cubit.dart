import 'package:bloc/bloc.dart';
import 'package:chat/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  List<Message> mesagesList = [];

  void sedMessage({required String message, required var email}) {
    try {
      messages.add({
        kMessage: message,
        kCreatedAt: DateTime.now(),
        kId: email,
      });
    } on Exception catch (e) {
      // TODO
    }
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      mesagesList.clear();
      for (var doc in event.docs) {
        mesagesList.add(Message.fromJeson(doc));
      }
      emit(ChatSuccess(mesages: mesagesList));
    });
  }
}
