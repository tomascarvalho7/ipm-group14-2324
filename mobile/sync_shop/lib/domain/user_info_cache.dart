class UserInfoCache {
  final String id;
  final String name;
  final String email;

  UserInfoCache(
      {
        required this.id,
        required this.name,
        required this.email
      }
      );

  /// Convert [UserInfoCache] into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  /// Convert from a JSON map to a [UserInfoCache] instance.
  factory UserInfoCache.fromJson(Map<String, dynamic> json) {
    return UserInfoCache(
        id: json['id'] as String,
        name: json['name'] as String,
        email: json['email'] as String);
  }
}