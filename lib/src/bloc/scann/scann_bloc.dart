import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../presentation/common/log.dart';
import '../../dto/scanner/scanned_code_dto.dart';
import '../../resources/repository/scaneed/scanned_code_repository.dart';

part 'scann_event.dart';
part 'scann_state.dart';

class ScannBloc extends Bloc<ScannEvent, ScannState> {
  final ScannedCodeRepository _repository;
  Timer? _feedbackTimer; // 🔁 Timer para controlar el feedback

  ScannBloc({ScannedCodeRepository? repository})
      : _repository = repository ?? ScannedCodeRepository(),
        super(ScannState()) {
    on<LoadCodesEvent>(_loadCodesEvent);
    on<DeleteCodeEvent>(_deleteCodeEvent);
    on<DeleteCodesEvent>(_deleteCodesEvent);
    on<RegisterCodeEvent>(_registerCodeEvent);
    on<SetFeedBackEvent>(_setFeedBackEvent);
  }

  void _registerCodeEvent(
    RegisterCodeEvent event,
    Emitter<ScannState> emit,
  ) async {
    try {
      ScannedCodeDTO request = event.request;
      logMessage(
        isError: false,
        tag: 'ScannBloc',
        message: 'Registrando código: ${request.content}',
      );
      await _repository.saveCode(request);
      add(LoadCodesEvent());
      add(SetFeedBackEvent(
          messageIsError: false, messageFeedback: event.succesText));
    } catch (e) {
      logMessage(
        isError: true,
        tag: 'ScannBloc',
        message: 'Error al registrar el código.',
        error: e.toString(),
      );

      add(SetFeedBackEvent(
          messageIsError: true, messageFeedback: event.errorText));
    }
  }

  void _deleteCodeEvent(
    DeleteCodeEvent event,
    Emitter<ScannState> emit,
  ) async {
    try {
      ScannedCodeDTO request = event.request;
      logMessage(
        isError: false,
        tag: 'ScannBloc',
        message: 'Eliminando código con ID: ${request.id}',
      );

      await _repository.deleteCode(request.id!);
      add(LoadCodesEvent());
      add(SetFeedBackEvent(
          messageIsError: false, messageFeedback: event.succesText));
    } catch (e) {
      logMessage(
        isError: true,
        tag: 'ScannBloc',
        message: 'Error al eliminar el código.',
        error: e.toString(),
      );
      add(SetFeedBackEvent(
          messageIsError: true, messageFeedback: event.errorText));
    }
  }

  void _deleteCodesEvent(
    DeleteCodesEvent event,
    Emitter<ScannState> emit,
  ) async {
    try {
      logMessage(
        isError: false,
        tag: 'ScannBloc',
        message: 'Eliminando todos los códigos (drop table)',
      );
      await _repository.dropTable();
    } catch (e) {
      logMessage(
        isError: true,
        tag: 'ScannBloc',
        message: 'Error al eliminar todos los códigos.',
        error: e.toString(),
      );
    }
  }

  void _loadCodesEvent(
    LoadCodesEvent event,
    Emitter<ScannState> emit,
  ) async {
    try {
      List<ScannedCodeDTO> codes = await _repository.fetchAllCodes();
      logMessage(
        isError: false,
        tag: 'ScannBloc',
        message: 'Códigos cargados: ${codes.length}',
      );
      emit(state.copyWith(codes: codes));
    } catch (e) {
      logMessage(
        isError: true,
        tag: 'ScannBloc',
        message: 'Error al cargar los códigos.',
        error: e.toString(),
      );
    }
  }

  void _setFeedBackEvent(
    SetFeedBackEvent event,
    Emitter<ScannState> emit,
  ) {
    emit(state.copyWith(
      messageIsError: event.messageIsError,
      messageFeedback: event.messageFeedback,
    ));

    _feedbackTimer?.cancel();
    _feedbackTimer = Timer(const Duration(seconds: 4), () {
      if (!isClosed) {
        add(const SetFeedBackEvent(messageIsError: false, messageFeedback: ""));
      }
    });
  }

  @override
  Future<void> close() {
    _feedbackTimer?.cancel();
    return super.close();
  }
}
