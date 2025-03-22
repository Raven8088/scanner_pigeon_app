class ScannedCodeDTO {
  final int? id;
  final String content;
  final String type;
  final DateTime timestamp;

  ScannedCodeDTO({
    this.id,
    required this.content,
    required this.type,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'type': type,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory ScannedCodeDTO.fromMap(Map<String, dynamic> map) {
    return ScannedCodeDTO(
      id: map['id'] as int?,
      content: map['content'] as String,
      type: map['type'] as String,
      timestamp: DateTime.parse(map['timestamp'] as String),
    );
  }
}
