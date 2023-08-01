import 'package:ai_tutor/bloc/chat_bloc.dart';
import 'package:ai_tutor/bloc/stt_bloc.dart';
import 'package:ai_tutor/utils/helpers/stt_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SttTest extends StatefulWidget {
  const SttTest({super.key});

  @override
  State<SttTest> createState() => _SttTestState();
}

class _SttTestState extends State<SttTest> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    SttProvider().injectBloc(context.read<SttBloc>(), context.read<ChatBloc>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('음성 입력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SttBloc, DefaultSttState>(builder: (context, state) {
              return Text(state.text);
            }),
            const SizedBox(height: 20),
            BlocBuilder<SttBloc, DefaultSttState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    state.isListening
                        ? SttProvider().stopListening()
                        : SttProvider().startListening();
                  },
                  child: Text(state.isListening ? '중지' : '시작'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
