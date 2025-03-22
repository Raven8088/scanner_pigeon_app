part of 'scann_bloc.dart';

class ScannState extends Equatable {
  final ScannedCodeDTO? currentCode;
  final List<ScannedCodeDTO> codes;
  final String messageFeedback;
  final bool messageIsError;
  const ScannState(
      {this.currentCode,
      this.codes = const [],
      this.messageFeedback = "",
      this.messageIsError = true});

  ScannState copyWith(
          {ScannedCodeDTO? currentCode,
          List<ScannedCodeDTO>? codes,
          String? messageFeedback,
          bool? messageIsError}) =>
      ScannState(
          currentCode: currentCode ?? this.currentCode,
          codes: codes ?? this.codes,
          messageFeedback: messageFeedback ?? this.messageFeedback,
          messageIsError: messageIsError ?? this.messageIsError);
  @override
  List<Object?> get props =>
      [currentCode, codes, messageFeedback, messageIsError];
}
