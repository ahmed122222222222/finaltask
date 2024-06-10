class Meta {
  int? currentPage;
  int? lastPage;

  Meta({this.currentPage, this.lastPage});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json['current_page'] as int?,
        lastPage: json['last_page'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'last_page': lastPage,
      };
}
