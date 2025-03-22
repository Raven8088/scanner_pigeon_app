part of 'scann_bloc.dart';

sealed class ScannEvent extends Equatable {
  const ScannEvent();

  @override
  List<Object> get props => [];
}

class LoadCodesEvent extends ScannEvent {}

class RegisterCodeEvent extends ScannEvent {
  final ScannedCodeDTO request;
  final String succesText;
  final String errorText;

  const RegisterCodeEvent(
      {required this.request,
      required this.succesText,
      required this.errorText});
}

class DeleteCodeEvent extends ScannEvent {
  final ScannedCodeDTO request;
  final String succesText;
  final String errorText;

  const DeleteCodeEvent(
      {required this.request,
      required this.succesText,
      required this.errorText});
}

class DeleteCodesEvent extends ScannEvent {}

class SetFeedBackEvent extends ScannEvent {
  final bool messageIsError;
  final String messageFeedback;

  const SetFeedBackEvent({
    required this.messageIsError,
    required this.messageFeedback,
  });
}
