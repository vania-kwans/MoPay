import 'package:flutter/material.dart';
import 'package:mopay_ewallet/bloc/auth/auth_bloc.dart';
import 'package:mopay_ewallet/bloc/auth/auth_state.dart';
import 'package:provider/provider.dart';

class KeyboardNumber extends StatelessWidget {
  final Function() onPressed;
  final int number;
  const KeyboardNumber(
      {super.key, required this.onPressed, required this.number});

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = context.read<AuthBloc>();
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: StreamBuilder<AuthState>(
          stream: bloc.controller,
          builder: (context, snapshot) {
            bool isLoading =
                snapshot.data?.isLoading ?? false || !snapshot.hasData;
            return TextButton(
              onPressed: isLoading ? null : onPressed,
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: isLoading ? Colors.grey : Colors.black,
                ),
              ),
            );
          }),
    );
  }
}
