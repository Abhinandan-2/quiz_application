class Question {

  String que;
  bool ans;
  Question(String q,bool b){
    que = q;
    ans = b;
  }

}

List<Question> quebank = [

  Question('The letter H is between letters G and J on a keyboard ?', true),
  Question('If you add the two numbers on the opposite sides of dice together, the answer is always 7 ?', true),
  Question('Can you sneeze during sleep ? ', false),
  Question('The total surface area of two human lungs is approximately 70 square metres ?', true),
  Question('Vatican City is the largest city in the world ?', false),
  Question('Penguins are not birds ?', false),
  Question('The total weight of termites on earth is much heavier than the total weight of humans on earth', true),
  Question('Jupiter, Saturn, Uranus, and Neptune are terrestrial planet ?', false),
  Question('Tomatoes are vegetables ?', false),
  Question('America is the 3rd world\'s most populous country ?', true),
  Question('Humans are the only animals that bury their dead ?', false),
  Question('Stars are just bright planets ?', false),
  Question('Ants live longer than most dogs ?', true),
  Question('Russia\'s area is larger than Pluto ?', true),
  Question('All babies are born totally blind ?', false),
];

