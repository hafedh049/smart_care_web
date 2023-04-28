import 'package:flutter/material.dart';

const Color white = Color.fromARGB(255, 255, 255, 255);
const Color blue = Color.fromARGB(255, 83, 127, 231);
const Color dark = Color.fromARGB(255, 57, 54, 70);
const Color welcomeWhite = Color.fromARGB(255, 246, 246, 246);
const Color blueTabs = Color.fromARGB(255, 214, 229, 250);
const Color selectedTab = Color.fromARGB(255, 109, 169, 228);
const Color grey = Colors.grey;

const Map<int, String> weekDays = <int, String>{0: "Mon", 1: "Tue", 2: "Wed", 3: "Thu", 4: "Fri", 5: "Sat", 6: "Sun"};

final Map<int, String> monthNames = <int, String>{0: 'January', 1: 'February', 2: 'March', 3: 'April', 4: 'May', 5: 'June', 6: 'July', 7: 'August', 8: 'September', 9: 'October', 10: 'November', 11: 'December'};

const String hafedhUrl = "https://img.freepik.com/photos-gratuite/groupe-travail-cadres_1418-40.jpg?w=1380&t=st=1682594581~exp=1682595181~hmac=2f914325c5b405daffff5798b699e9d4649ad828d6813f3e9809590b5a150bad";

final List<Map<String, dynamic>> userMessages = <Map<String, dynamic>>[
  <String, dynamic>{
    "lastMessage": <String, dynamic>{"text": "Hey, are you free tonight?", "timestamp": DateTime(2023, 4, 27, 18, 0, 0)},
    "messages": <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, what's up?", "me": true, "timestamp": DateTime(2023, 4, 27, 16, 0, 0)},
      <String, dynamic>{"text": "Nothing much, just wondering if you're free tonight.", "me": false, "timestamp": DateTime(2023, 4, 27, 16, 30, 0)},
      <String, dynamic>{"text": "Yeah, I think I am. What did you have in mind?", "me": true, "timestamp": DateTime(2023, 4, 27, 17, 0, 0)},
      <String, dynamic>{"text": "How about we grab dinner and see a movie?", "me": false, "timestamp": DateTime(2023, 4, 27, 17, 30, 0)},
      <String, dynamic>{"text": "Sounds good to me! What time should we meet?", "me": true, "timestamp": DateTime(2023, 4, 27, 18, 0, 0)},
      <String, dynamic>{"text": "Let's meet at 7 pm at the restaurant.", "me": false, "timestamp": DateTime(2023, 4, 27, 18, 30, 0)}
    ]
  },
  <String, dynamic>{
    "lastMessage": <String, dynamic>{"text": "Thanks for your help, I really appreciate it.", "timestamp": DateTime(2023, 4, 26, 12, 0, 0)},
    "messages": <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, can you help me with something?", "me": true, "timestamp": DateTime(2023, 4, 26, 10, 0, 0)},
      <String, dynamic>{"text": "Sure, what do you need?", "me": false, "timestamp": DateTime(2023, 4, 26, 10, 30, 0)},
      <String, dynamic>{"text": "I need some advice on how to fix my computer.", "me": true, "timestamp": DateTime(2023, 4, 26, 11, 0, 0)},
      <String, dynamic>{"text": "Okay, let me take a look.", "me": false, "timestamp": DateTime(2023, 4, 26, 11, 30, 0)},
      <String, dynamic>{"text": "Thank you so much for your help!", "me": true, "timestamp": DateTime(2023, 4, 26, 12, 0, 0)}
    ]
  },
  <String, dynamic>{
    "lastMessage": <String, dynamic>{"text": "I'm sorry to hear that, let me know if you need anything.", "timestamp": DateTime(2023, 4, 25, 14, 0, 0)},
    "messages": <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, I just got some bad news.", "me": true, "timestamp": DateTime(2023, 4, 25, 12, 0, 0)},
      <String, dynamic>{"text": "What happened?", "me": false, "timestamp": DateTime(2023, 4, 25, 12, 30, 0)},
      <String, dynamic>{"text": "My dog passed away this morning.", "me": true, "timestamp": DateTime(2023, 4, 25, 13, 0, 0)},
      <String, dynamic>{"text": "Oh no, I'm so sorry to hear that.", "me": false, "timestamp": DateTime(2023, 4, 25, 13, 30, 0)},
      <String, dynamic>{"text": "Thanks, it's been tough.", "me": true, "timestamp": DateTime(2023, 4, 25, 14, 0, 0)}
    ]
  },
  <String, dynamic>{
    "lastMessage": <String, dynamic>{"text": "No worries, take your time.", "timestamp": DateTime(2023, 4, 24, 16, 0, 0)},
    "messages": <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, did you get a chance to read my email?", "me": true, "timestamp": DateTime(2023, 4, 24, 14, 0, 0)},
      <String, dynamic>{"text": "Not yet, I'm still catching up on some other work.", "me": false, "timestamp": DateTime(2023, 4, 24, 14, 30, 0)},
      <String, dynamic>{"text": "Okay, just let me know when you have a chance to look at it.", "me": true, "timestamp": DateTime(2023, 4, 24, 15, 0, 0)},
      <String, dynamic>{"text": "Will do, thanks for your patience.", "me": false, "timestamp": DateTime(2023, 4, 24, 16, 0, 0)}
    ]
  },
  <String, dynamic>{
    "lastMessage": <String, dynamic>{"text": "Great, see you then!", "timestamp": DateTime(2023, 4, 23, 18, 0, 0)},
    "messages": <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, are you free to meet up tomorrow?", "me": true, "timestamp": DateTime(2023, 4, 23, 16, 0, 0)},
      <String, dynamic>{"text": "Yes, I think I am. What did you have in mind?", "me": false, "timestamp": DateTime(2023, 4, 23, 16, 30, 0)},
      <String, dynamic>{"text": "How about we grab coffee and catch up?", "me": true, "timestamp": DateTime(2023, 4, 23, 17, 0, 0)},
      <String, dynamic>{"text": "That sounds perfect, what time?", "me": false, "timestamp": DateTime(2023, 4, 23, 17, 30, 0)},
      <String, dynamic>{"text": "Let's meet at 10 am.", "me": true, "timestamp": DateTime(2023, 4, 23, 18, 0, 0)}
    ]
  },
  <String, dynamic>{
    "lastMessage": <String, dynamic>{"text": "Thanks for letting me know, I'll see you later.", "timestamp": DateTime(2023, 4, 22, 12, 0, 0)},
    "messages": <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, I'm feeling really sick today.", "me": true, "timestamp": DateTime(2023, 4, 22, 10, 0, 0)},
      <String, dynamic>{"text": "Oh no, I'm sorry to hear that. Are you going to the doctor?", "me": false, "timestamp": DateTime(2023, 4, 22, 10, 30, 0)},
      <String, dynamic>{"text": "Yeah, I have an appointment at 11 am.", "me": true, "timestamp": DateTime(2023, 4, 22, 11, 0, 0)},
      <String, dynamic>{"text": "Okay, well I hope you feel better soon.", "me": false, "timestamp": DateTime(2023, 4, 22, 11, 30, 0)},
      <String, dynamic>{"text": "Thanks, I'll keep you updated.", "me": true, "timestamp": DateTime(2023, 4, 22, 12, 0, 0)}
    ]
  },
  <String, dynamic>{
    "lastMessage": <String, dynamic>{"text": "Okay, I'll see you then!", "timestamp": DateTime(2023, 4, 20, 17, 0, 0)},
    "messages": <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, are you free to meet up tomorrow?", "me": true, "timestamp": DateTime(2023, 4, 20, 15, 0, 0)},
      <String, dynamic>{"text": "Yeah, I think so. What did you have in mind?", "me": false, "timestamp": DateTime(2023, 4, 20, 15, 30, 0)},
      <String, dynamic>{"text": "How about we go for a hike in the morning?", "me": true, "timestamp": DateTime(2023, 4, 20, 16, 0, 0)},
      <String, dynamic>{"text": "Sounds good to me. What time should we meet?", "me": false, "timestamp": DateTime(2023, 4, 20, 16, 30, 0)},
      <String, dynamic>{"text": "Let's meet at 9 am at the trailhead.", "me": true, "timestamp": DateTime(2023, 4, 20, 17, 0, 0)}
    ],
  },
  <String, dynamic>{
    "lastMessage": <String, dynamic>{"text": "Thanks for the update, I'll let the team know.", "timestamp": DateTime(2023, 4, 19, 14, 0, 0)},
    "messages": <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, just wanted to give you a quick update on the project.", "me": true, "timestamp": DateTime(2023, 4, 19, 13, 0, 0)},
      <String, dynamic>{"text": "Sure, what's going on?", "me": false, "timestamp": DateTime(2023, 4, 19, 13, 5, 0)},
      <String, dynamic>{"text": "We're running a bit behind schedule, but we're working on catching up.", "me": true, "timestamp": DateTime(2023, 4, 19, 13, 10, 0)},
      <String, dynamic>{"text": "Thanks for letting me know. Do you have an updated timeline?", "me": false, "timestamp": DateTime(2023, 4, 19, 13, 30, 0)},
      <String, dynamic>{"text": "Not yet, but I'll keep you posted.", "me": true, "timestamp": DateTime(2023, 4, 19, 14, 0, 0)}
    ],
  },
  <String, dynamic>{
    'lastMessage': <String, dynamic>{"text": "See you later!", "timestamp": DateTime(2023, 4, 27, 11, 05)},
    'messages': <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, how's it going?", "me": false, "timestamp": DateTime(2023, 4, 25, 10, 30)},
      <String, dynamic>{"text": "I'm doing well, thanks for asking. How about you?", "me": true, "timestamp": DateTime(2023, 4, 25, 10, 35)},
      <String, dynamic>{"text": "I'm good too. What are you up to today?", "me": false, "timestamp": DateTime(2023, 4, 25, 10, 40)},
      <String, dynamic>{"text": "Just running some errands. What about you?", "me": true, "timestamp": DateTime(2023, 4, 25, 10, 45)},
      <String, dynamic>{"text": "I'm meeting up with some friends for lunch.", "me": false, "timestamp": DateTime(2023, 4, 25, 10, 50)},
      <String, dynamic>{"text": "Sounds like fun. Enjoy your day!", "me": true, "timestamp": DateTime(2023, 4, 25, 10, 55)},
      <String, dynamic>{"text": "Thanks, you too!", "me": false, "timestamp": DateTime(2023, 4, 25, 11, 00)},
      <String, dynamic>{"text": "See you later!", "me": true, "timestamp": DateTime(2023, 4, 25, 11, 05)},
    ],
  },
  <String, dynamic>{
    'lastMessage': <String, dynamic>{"text": "Can't wait to see you!", "timestamp": DateTime(2023, 4, 26, 15, 35)},
    'messages': <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, how was your day?", "me": true, "timestamp": DateTime(2023, 4, 26, 15, 00)},
      <String, dynamic>{"text": "It was pretty good, thanks for asking. How about yours?", "me": false, "timestamp": DateTime(2023, 4, 26, 15, 05)},
      <String, dynamic>{"text": "It was okay, nothing too exciting. So, what are your plans for the weekend?", "me": false, "timestamp": DateTime(2023, 4, 26, 15, 10)},
      <String, dynamic>{"text": "I'm actually heading out of town to visit my family. How about you?", "me": true, "timestamp": DateTime(2023, 4, 26, 15, 15)},
      <String, dynamic>{"text": "I'm going to a concert with some friends on Saturday. Can't wait!", "me": false, "timestamp": DateTime(2023, 4, 26, 15, 20)},
      <String, dynamic>{"text": "That sounds like a lot of fun. Enjoy yourself!", "me": true, "timestamp": DateTime(2023, 4, 26, 15, 25)},
      <String, dynamic>{"text": "Thanks, I will. Can't wait to see you when you get back!", "me": false, "timestamp": DateTime(2023, 4, 26, 15, 30)},
      <String, dynamic>{"text": "Can't wait to see you too!", "me": true, "timestamp": DateTime(2023, 4, 26, 15, 35)},
    ],
  },
  <String, dynamic>{
    'lastMessage': <String, dynamic>{"text": "I'm sorry for the misunderstanding.", "timestamp": DateTime(2023, 4, 25, 14, 40)},
    'messages': <Map<String, dynamic>>[
      <String, dynamic>{"text": "Hey, did you get a chance to look over the proposal?", "me": true, "timestamp": DateTime(2023, 4, 25, 14, 00)},
      <String, dynamic>{"text": "Yes, I did. But there seems to be some confusion about the direction we're taking with this project.", "me": false, "timestamp": DateTime(2023, 4, 25, 14, 05)},
      <String, dynamic>{"text": "Really? What do you mean?", "me": true, "timestamp": DateTime(2023, 4, 25, 14, 10)},
      <String, dynamic>{"text": "Well, I thought we agreed on using this technology, but your proposal suggests otherwise.", "me": false, "timestamp": DateTime(2023, 4, 25, 14, 15)},
      <String, dynamic>{"text": "Oh, I see what you mean. That was just a suggestion. We can definitely use the technology we agreed upon.", "me": true, "timestamp": DateTime(2023, 4, 25, 14, 20)},
      <String, dynamic>{"text": "Okay, good. I'm sorry for the misunderstanding.", "me": false, "timestamp": DateTime(2023, 4, 25, 14, 25)},
      <String, dynamic>{"text": "No problem, I should have been more clear. Thanks for bringing it up.", "me": true, "timestamp": DateTime(2023, 4, 25, 14, 30)},
      <String, dynamic>{"text": "I'm sorry for the misunderstanding.", "me": false, "timestamp": DateTime(2023, 4, 25, 14, 40)},
    ],
  },
];

final List<String> times = <String>["00:00", "01:30", "02:45", "03:15", "04:20", "05:55", "06:30", "07:45", "08:10", "09:30", "10:15", "11:30", "12:00", "13:30", "14:45", "15:15", "16:20", "17:55", "18:30", "19:45", "20:10", "21:30", "22:15", "23:30", "00:45", "01:10", "02:30", "03:15", "04:20", "05:55"];

const List<Color> darkContrastColors = <Color>[
  welcomeWhite,
  Color(0xFF9FA8DA), // Light blue
  Color(0xFF81C784), // Light green
  Color(0xFFFFB74D), // Light orange
  Color(0xFFBA68C8), // Light purple
  Color(0xFF4FC3F7), // Light cyan
  Color(0xFFFF8A65), // Light amber
  Color(0xFFA1887F), // Light brown
  Color(0xFF80CBC4), // Light teal
  Color(0xFF9575CD), // Light indigo
  Color(0xFF90A4AE), // Light grey
  Color(0xFF66BB6A), // Light lime green
];

final GlobalKey calendarKey = GlobalKey();
int appointmentTypeIsCalendar = 1;

final GlobalKey conversationKey = GlobalKey();
final GlobalKey chatKey = GlobalKey();
final GlobalKey detailsKey = GlobalKey();

int discussionIndex = 0;
Color discussionBgColor = welcomeWhite;
