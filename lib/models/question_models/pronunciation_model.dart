import 'package:startupkit/models/question_model.dart';

class Pronunciation extends QuestionModel {
  String words;
  List<String> synonymsList;
  String answer;
  String userAnswer;
  String wordType;
  String wordDescription;
  Pronunciation(
      {required this.words,
      required this.synonymsList,
      required this.answer,
      required this.userAnswer,
      required this.wordType,
      required this.wordDescription,
      required String questionId,
      required QuestionType questionType})
      : super(questionId: questionId, questionType: questionType);
}

Pronunciation pronunciation1 = Pronunciation(
    words: 'Serenity',
    synonymsList: [
      'Calmness',
      'Quietness',
      'Stillness',
      'Poise',
      'Peacefulness',
      'Placidity'
    ],
    answer: 'Quietness',
    userAnswer: '',
    wordType: 'Noun',
    wordDescription:
        'Serenity is a state of being calm, peaceful, and free from stress or agitation. Serenity is often associated with a sense of harmony, contentment',
    questionId: 'pronunciation1',
    questionType: QuestionType.pronunciation);
Pronunciation pronunciation2 = Pronunciation(
    words: 'abase',
    synonymsList: [
      'humiliate',
      'degrade',
      'demean',
      'lower',
      'abase',
      'cheapen'
    ],
    answer: 'abase',
    userAnswer: '',
    wordType: 'verb',
    wordDescription:
        'behave in a way so as to belittle or degrade (someone). "I watched my colleagues abasing themselves before the board of trustees"',
    questionId: 'pronunciation2',
    questionType: QuestionType.pronunciation);
Pronunciation pronunciation3 = Pronunciation(
    words: 'abash',
    synonymsList: [
      'embarrass',
      'humiliate',
      'mortify',
      'abash',
      'chagrin',
      'discomfit'
    ],
    answer: 'abash',
    userAnswer: '',
    wordType: 'verb',
    wordDescription:
        'cause to feel embarrassed, disconcerted, or ashamed. "she was not abashed at being caught"',
    questionId: 'pronunciation3',
    questionType: QuestionType.pronunciation);
Pronunciation pronunciation4 = Pronunciation(
    words: 'abate',
    synonymsList: [
      'subside',
      'abate',
      'die down',
      'die out',
      'ebb',
      'slack off'
    ],
    answer: 'abate',
    userAnswer: '',
    wordType: 'verb',
    wordDescription:
        '(of something perceived as hostile, threatening, or negative) become less intense or widespread. "the storm suddenly abated"',
    questionId: 'pronunciation4',
    questionType: QuestionType.pronunciation);
Pronunciation pronunciation5 = Pronunciation(
    words: 'abbreviate',
    synonymsList: [
      'shorten',
      'cut',
      'cut short',
      'curtail',
      'truncate',
      'abbreviate'
    ],
    answer: 'abbreviate',
    userAnswer: '',
    wordType: 'verb',
    wordDescription:
        'shorten (a word, phrase, or text). "they were asked to abbreviate their remarks"',
    questionId: 'pronunciation5',
    questionType: QuestionType.pronunciation);
Pronunciation pronunciation6 = Pronunciation(
    words: 'abdicate',
    synonymsList: [
      'renounce',
      'relinquish',
      'give up',
      'abdicate',
      'reject',
      'resign'
    ],
    answer: 'abdicate',
    userAnswer: '',
    wordType: 'verb',
    wordDescription:
        '(of a monarch) renounce one\'s throne. "in 1918 Kaiser Wilhelm abdicated as German emperor"',
    questionId: 'pronunciation6',
    questionType: QuestionType.pronunciation);
