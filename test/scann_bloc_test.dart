import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sacanner_pigeon_app/src/bloc/scann/scann_bloc.dart';
import 'package:sacanner_pigeon_app/src/dto/scanner/scanned_code_dto.dart';
import 'package:sacanner_pigeon_app/src/resources/repository/scaneed/scanned_code_repository.dart';

class MockScannedCodeRepository extends Mock implements ScannedCodeRepository {}

void main() {
  TestWidgetsFlutterBinding
      .ensureInitialized(); // 🔥 Necesario para usar WidgetsBinding
  late ScannBloc scannBloc;
  late MockScannedCodeRepository mockRepository;

  setUp(() {
    mockRepository = MockScannedCodeRepository();
    scannBloc = ScannBloc(repository: mockRepository);
  });

  tearDown(() {
    scannBloc.close();
  });

  group('ScannBloc - LoadCodesEvent', () {
    final codesMock = [
      ScannedCodeDTO(
        id: 1,
        content: 'https://example.com',
        type: 'URL',
        timestamp: DateTime.parse('2023-01-01'),
      ),
      ScannedCodeDTO(
        id: 2,
        content: 'hello world',
        type: 'Texto Plano',
        timestamp: DateTime.parse('2023-01-02'),
      ),
    ];

    blocTest<ScannBloc, ScannState>(
      'emite estado con códigos cargados correctamente',
      build: () {
        when(() => mockRepository.fetchAllCodes())
            .thenAnswer((_) async => codesMock);
        return scannBloc;
      },
      act: (bloc) => bloc.add(LoadCodesEvent()),
      expect: () => [
        scannBloc.state.copyWith(codes: codesMock),
      ],
      verify: (_) {
        verify(() => mockRepository.fetchAllCodes()).called(1);
      },
    );
  });

  group('ScannBloc - RegisterCodeEvent', () {
    final newCode = ScannedCodeDTO(
      id: 3,
      content: 'sms:1234',
      type: 'Mensaje SMS',
      timestamp: DateTime.parse('2023-01-03'),
    );

    final updatedCodes = [
      ScannedCodeDTO(
        id: 1,
        content: 'https://example.com',
        type: 'URL',
        timestamp: DateTime.parse('2023-01-01'),
      ),
      newCode,
    ];

    blocTest<ScannBloc, ScannState>(
      'guarda un nuevo código y actualiza el estado',
      build: () {
        when(() => mockRepository.saveCode(newCode)).thenAnswer((_) async {});
        when(() => mockRepository.fetchAllCodes())
            .thenAnswer((_) async => updatedCodes);
        return scannBloc;
      },
      act: (bloc) => bloc.add(RegisterCodeEvent(
        request: newCode,
        succesText: 'ok',
        errorText: 'no ok',
      )),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        scannBloc.state.copyWith(
          codes: updatedCodes,
          messageFeedback: '',
          messageIsError: true, // Este estado intermedio es emitido antes
        ),
        scannBloc.state.copyWith(
          codes: updatedCodes,
          messageFeedback: 'ok',
          messageIsError: false,
        ),
      ],
    );
  });

  group('ScannBloc - DeleteCodeEvent', () {
    final codeToDelete = ScannedCodeDTO(
      id: 2,
      content: 'hello world',
      type: 'Texto Plano',
      timestamp: DateTime.parse('2023-01-02'),
    );

    final remainingCodes = [
      ScannedCodeDTO(
        id: 1,
        content: 'https://example.com',
        type: 'URL',
        timestamp: DateTime.parse('2023-01-01'),
      ),
    ];

    blocTest<ScannBloc, ScannState>(
      'elimina un código y actualiza el estado',
      build: () {
        when(() => mockRepository.deleteCode(codeToDelete.id!))
            .thenAnswer((_) async {});
        when(() => mockRepository.fetchAllCodes())
            .thenAnswer((_) async => remainingCodes);
        return scannBloc;
      },
      act: (bloc) => bloc.add(DeleteCodeEvent(
        request: codeToDelete,
        succesText: 'ok',
        errorText: 'no ok',
      )),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        scannBloc.state.copyWith(
          codes: remainingCodes,
          messageFeedback: '',
          messageIsError: true,
        ),
        scannBloc.state.copyWith(
          codes: remainingCodes,
          messageFeedback: 'ok',
          messageIsError: false,
        ),
      ],
    );
  });

  group('ScannBloc - DeleteCodesEvent', () {
    blocTest<ScannBloc, ScannState>(
      'elimina la tabla completa',
      build: () {
        when(() => mockRepository.dropTable()).thenAnswer((_) async {});
        return scannBloc;
      },
      act: (bloc) => bloc.add(DeleteCodesEvent()),
      expect: () => <ScannState>[],
      verify: (_) {
        verify(() => mockRepository.dropTable()).called(1);
      },
    );
  });

  group('ScannBloc - SetFeedBackEvent', () {
    blocTest<ScannBloc, ScannState>(
      'emite feedback y luego lo limpia después de un tiempo',
      build: () => scannBloc,
      act: (bloc) async {
        bloc.add(const SetFeedBackEvent(
          messageFeedback: 'Operación exitosa',
          messageIsError: false,
        ));
      },
      wait: const Duration(seconds: 5), // 🔁 suficiente para esperar el reset
      expect: () => [
        scannBloc.state.copyWith(
          messageFeedback: 'Operación exitosa',
          messageIsError: false,
        ),
        scannBloc.state.copyWith(
          messageFeedback: '',
          messageIsError: false,
        ),
      ],
    );
  });
}
