class Search {
  String startRange;
  String endRange;
  String search;

  // String xyz;
  Search({
    this.startRange,
    this.endRange,
    this.search,
  });
  // factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);

  _$ModelToJson(Search instance) => <String, dynamic>{
        'startRange': instance.startRange,
        'endRange': instance.endRange,
        'search': instance.search,
      };
}
