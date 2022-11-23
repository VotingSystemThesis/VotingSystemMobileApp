class VoteConfirm {
  final String id;

  const VoteConfirm({
    required this.id,
  });

  static VoteConfirm fromJson(json) => VoteConfirm(
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
