// theme_model.dart - tiny model to hold theme values loaded from JSON
class ThemeModel {
  final String id;
  final String displayName;
  final String primaryColor;
  final String accentColor;
  final Map<String, String> roomImages;
  final Map<String, String> sounds;

  ThemeModel({
    required this.id,
    required this.displayName,
    required this.primaryColor,
    required this.accentColor,
    required this.roomImages,
    required this.sounds,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> j) {
    final rooms = <String, String>{};
    if (j['roomImages'] is Map) {
      (j['roomImages'] as Map).forEach((k, v) {
        rooms[k.toString()] = v.toString();
      });
    }
    final sounds = <String, String>{};
    if (j['sounds'] is Map) {
      (j['sounds'] as Map).forEach((k, v) {
        sounds[k.toString()] = v.toString();
      });
    }
    return ThemeModel(
      id: j['id'] ?? 'global',
      displayName: j['displayName'] ?? 'Global Home',
      primaryColor: j['primaryColor'] ?? '#C4A484',
      accentColor: j['accentColor'] ?? '#5A4634',
      roomImages: rooms,
      sounds: sounds,
    );
  }
}