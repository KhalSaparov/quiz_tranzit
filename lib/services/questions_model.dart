import 'package:quiz_tranzit/services/networking.dart';

const questionsAPI =
    'https://the-trivia-api.com/api/questions?categories=arts_and_literature,food_and_drink,film_and_tv,general_knowledge,geography,history,music,science,society_and_culture,sport_and_leisure&limit';

class QuestionsModel {
  Future<dynamic> getQuestions(String questionsAmount, String difficulty) async {
    NetworkHelper networkHelper =
        NetworkHelper('$questionsAPI=$questionsAmount&difficulty=$difficulty');
    var questionsData = await networkHelper.getData();
    return questionsData;
  }
}
