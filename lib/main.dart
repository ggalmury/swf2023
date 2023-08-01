import 'package:ai_tutor/apis/gpt_api.dart';
import 'package:ai_tutor/bloc/chat_bloc.dart';
import 'package:ai_tutor/bloc/stt_bloc.dart';
import 'package:ai_tutor/screens/ai_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(lineLength: 60, colors: true),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(lineLength: 60, methodCount: 0),
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => GPTApi()),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => SttBloc()),
        BlocProvider(
          create: (context) => ChatBloc(context.read<GPTApi>()),
        )
      ], child: const MaterialApp(home: AiChat())),
    );
  }
}
