import '../../../dto/scanner/scanned_code_dto.dart';
import '../../provider/scanned/scanned_code_provider.dart';

class ScannedCodeRepository {
  final ScannedCodeProvider _provider;

  ScannedCodeRepository({ScannedCodeProvider? provider})
      : _provider = provider ?? ScannedCodeProvider();

  Future<void> saveCode(ScannedCodeDTO code) async {
    await _provider.insertCode(code);
  }

  Future<List<ScannedCodeDTO>> fetchAllCodes() async {
    return await _provider.getAllCodes();
  }

  Future<void> clearAll() async {
    await _provider.deleteAll();
  }

  Future<void> deleteCode(int id) async {
    await _provider.deleteById(id);
  }

  Future<void> dropTable() async {
    await _provider.dropTable();
  }
}
