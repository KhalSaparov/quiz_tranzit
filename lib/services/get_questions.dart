class GetQuestions {
  GetQuestions({
    required this.data,
  });

  List data;

  factory GetQuestions.fromJson(Map<dynamic, dynamic> json) => GetQuestions(
        data: json['data'],
      );

  List getAnswers() {
    List answersA = [];
    for (var i = 0; i < data.length; i++) {
      String correct = data[i]['correctAnswer'].toString();
      List answersB = [correct];
      for (var a = 0; a < 3; a++) {
        String inCorrect = data[i]['incorrectAnswers'][a].toString();
        answersB.add(inCorrect);
      }
      answersB.sort((a, b) => a.length.compareTo(b.length));
      answersA.add(answersB);
    }
    return answersA;
  }
}
