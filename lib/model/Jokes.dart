class ForCount {
  int count ;
  String lang;
  bool isSelected ;
  ForCount({ this.count = 0, this.lang = "en", this.isSelected = false});

  static final tests = [
    ForCount(count: 0, isSelected: true),
    ForCount(count: 0),
    ForCount(count: 0)
  ];
}
