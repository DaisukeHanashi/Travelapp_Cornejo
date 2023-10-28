import 'package:flutter/material.dart';
import 'articles.dart';

class Author {
  String firstName = ' ';
  String lastName = ' ';
  var articles = [];
  Author(this.firstName, this.lastName);

  addArticles(Article article) => articles.add(article);

  String get fullName => firstName + ' ' + lastName;
}

var authors = [
  Author('Boss', 'Daisuc'),
  Author('Zar', 'Jey'),
  Author('Boss', 'Atan')
];

void addArticle<T>(T object, Article article) {
  if (object is Author) {
    // If the object is an Author, add the article to the Author's articles list
    (object as Author).articles.add(article);
  } else {
    // Handle other object types or provide an error message
    print('Unsupported object type for adding articles');
  }
}

void load() {
  int x = 0;
  var articles = [
    Article(
        'assets/images/russiaInvade.webp',
        'The invasion of Russia',
        "Russia has invaded Ukraine under Putin's order",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    Article(
        'assets/images/pVi.jpg',
        'War on Palestine',
        "Jews vs. Muslims: Who would win?",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    Article(
        'assets/images/confidential-funds.webp',
        'Confidential Funds',
        'Where art the money going?',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    Article(
        'assets/images/dangerous_countries.jpg',
        'Top 10 Dangerous Countries in the World',
        "Don't ever go into these places, like please?",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    Article(
        'assets/images/inflationPH.jpg',
        'Inflation Rate in the Philippines rising!',
        "Why? Just why? Why are we suffering?",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    Article(
        'assets/images/jimin_nabuntis_patay.jpg',
        'Mysterious Pregnancy and Death of Jimin',
        "Si Jimin, nabuntis... patay!",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
  ];

  for (int i = 0; i < articles.length; i++) {
    if (x >= authors.length) x = 0;

    addArticle<Author>(authors[x], articles[i]);
    x++;
  }
}
