import 'package:emirate_insight/data/question_class.dart';
import "package:flutter/material.dart";
import 'emirate_class.dart';
import 'info_class.dart';

class Constants {

  // Colors used in the app
  static Color mainColor = Color(0xFFff5757);
  static Color secondaryColor = Color(0xFFf5f3f5);
  static Color correctAnsColor = Color(0xFF00bf63);
  static Color wrongAnsColor = Color(0xFFff0000);



  // Map that links each Emirate to a list of questions
  static final Map<String, List<Question>> quizzes = {
    "Abu Dhabi": [
      Question(
        question: "Who founded Abu Dhabi in the mid-18th century?",
        options: [
          "Al Nahyan family",
          "Al Maktoum family",
          "Al Qasimi family",
          "Bani Yas tribe"
        ],
        correctAnswerIndex: 3,
      ),
      Question(
        question: "Which famous mosque is located in Abu Dhabi?",
        options: [
          "Al Noor Mosque",
          "Sheikh Zayed Grand Mosque",
          "Al Bidya Mosque",
          "Jumeirah Mosque"
        ],
        correctAnswerIndex: 1,
      ),
      Question(
        question: "What is Abu Dhabi famous for?",
        options: [
          "Oil wealth and cultural heritage",
          "Tourism and luxury lifestyle",
          "Mountains and adventure tourism",
          "Traditional crafts"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Which world-class museum is located in Abu Dhabi?",
        options: [
          "Louvre Abu Dhabi",
          "Dubai Museum",
          "Sharjah Museum of Islamic Civilization",
          "Ajman Museum"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What geographic features characterize Abu Dhabi?",
        options: [
          "Mountains and forests",
          "Deserts, islands, and coastline",
          "Plains and rivers",
          "Jungles and lakes"
        ],
        correctAnswerIndex: 1,
      ),
    ],
    "Dubai": [
      Question(
        question: "What is the tallest building in the world located in Dubai?",
        options: [
          "Burj Al Arab",
          "Burj Khalifa",
          "Palm Jumeirah",
          "Dubai Mall"
        ],
        correctAnswerIndex: 1,
      ),
      Question(
        question: "Which family founded Dubai in the early 19th century?",
        options: [
          "Al Nahyan",
          "Al Qasimi",
          "Al Maktoum",
          "Al Sharqi"
        ],
        correctAnswerIndex: 2,
      ),
      Question(
        question: "What is Dubai famous for?",
        options: [
          "Oil wealth",
          "Tourism and luxury lifestyle",
          "Cultural preservation",
          "Natural landscapes"
        ],
        correctAnswerIndex: 1,
      ),
      Question(
        question: "Which man-made island is a famous landmark in Dubai?",
        options: [
          "Palm Jumeirah",
          "Yas Island",
          "Dhayah Fort",
          "Ajman Corniche"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Approximately how many residents does Dubai have?",
        options: [
          "1.5 million",
          "500,000",
          "Over 3 million",
          "72,000"
        ],
        correctAnswerIndex: 2,
      ),
    ],
    "Sharjah": [
      Question(
        question: "Which emirate is known for cultural preservation and arts?",
        options: ["Ajman", "Sharjah", "Fujairah", "Ras Al Khaimah"],
        correctAnswerIndex: 1,
      ),
      Question(
        question: "What is a famous cultural landmark in Sharjah?",
        options: [
          "Sharjah Museum of Islamic Civilization",
          "Sheikh Zayed Grand Mosque",
          "Ajman Fort",
          "Fujairah Fort"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Who is the current ruler of Sharjah?",
        options: [
          "Sheikh Sultan bin Muhammad Al Qasimi",
          "Sheikh Saud bin Saqr Al Qasimi",
          "Sheikh Humaid bin Rashid Al Nuaimi",
          "Sheikh Hamad bin Mohammed Al Sharqi"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What is Sharjah famous for?",
        options: [
          "Cultural preservation and arts",
          "Tourism and luxury lifestyle",
          "Mountains and adventure tourism",
          "Oil wealth"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Approximately how large is Sharjah in square kilometers?",
        options: ["2,590", "4,114", "260", "1,684"],
        correctAnswerIndex: 0,
      ),
    ],
    "Ajman": [
      Question(
        question: "What is Ajman famous for?",
        options: [
          "Mountains and adventure tourism",
          "Traditional crafts and coastal charm",
          "Oil wealth",
          "Beaches and historical sites"
        ],
        correctAnswerIndex: 1,
      ),
      Question(
        question: "Which landmark highlights Ajman’s history?",
        options: ["Ajman Fort", "Jebel Jais", "Dreamland Aqua Park", "Louvre Abu Dhabi"],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Who is the current ruler of Ajman?",
        options: [
          "Sheikh Humaid bin Rashid Al Nuaimi",
          "Sheikh Saud bin Rashid Al Mualla",
          "Sheikh Mohamed bin Zayed Al Nahyan",
          "Sheikh Mohammed bin Rashid Al Maktoum"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What is the approximate size of Ajman in square kilometers?",
        options: ["260", "770", "1,166", "4,114"],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Ajman is located on which coast?",
        options: [
          "Gulf of Oman",
          "Arabian Gulf",
          "Red Sea",
          "Mediterranean Sea"
        ],
        correctAnswerIndex: 1,
      ),
    ],
    "Umm Al Quwain": [
      Question(
        question: "Which emirate is known for natural landscapes and tranquility?",
        options: ["Umm Al Quwain", "Dubai", "Sharjah", "Abu Dhabi"],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What is a notable attraction in Umm Al Quwain?",
        options: [
          "Dreamland Aqua Park",
          "Burj Khalifa",
          "Al Noor Mosque",
          "Palm Jumeirah"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Who is the current ruler of Umm Al Quwain?",
        options: [
          "Sheikh Saud bin Rashid Al Mualla",
          "Sheikh Humaid bin Rashid Al Nuaimi",
          "Sheikh Mohamed bin Zayed Al Nahyan",
          "Sheikh Hamad bin Mohammed Al Sharqi"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Approximately how many residents live in Umm Al Quwain?",
        options: ["72,000", "500,000", "1.5 million", "400,000"],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What geographic features characterize Umm Al Quwain?",
        options: [
          "Coastal plains and islands",
          "Mountains and deserts",
          "Urban and industrial zones",
          "Forests and rivers"
        ],
        correctAnswerIndex: 0,
      ),
    ],
    "Ras Al Khaimah": [
      Question(
        question: "What is the highest peak in the UAE located in Ras Al Khaimah?",
        options: ["Jebel Jais", "Jebel Hafeet", "Jebel Ali", "Jebel Al Dhanna"],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What is Ras Al Khaimah famous for?",
        options: [
          "Mountains and adventure tourism",
          "Oil wealth",
          "Luxury lifestyle",
          "Cultural preservation"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Who is the current ruler of Ras Al Khaimah?",
        options: [
          "Sheikh Saud bin Saqr Al Qasimi",
          "Sheikh Sultan bin Muhammad Al Qasimi",
          "Sheikh Humaid bin Rashid Al Nuaimi",
          "Sheikh Hamad bin Mohammed Al Sharqi"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What is the approximate size of Ras Al Khaimah in square kilometers?",
        options: ["1,684", "770", "260", "4,114"],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "Which of these is a famous landmark in Ras Al Khaimah?",
        options: ["Dhayah Fort", "Ajman Fort", "Louvre Abu Dhabi", "Al Noor Mosque"],
        correctAnswerIndex: 0,
      ),
    ],
    "Fujairah": [
      Question(
        question: "Which emirate is located entirely on the Gulf of Oman coast?",
        options: ["Fujairah", "Ajman", "Dubai", "Sharjah"],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What is the oldest mosque in the UAE located in Fujairah?",
        options: [
          "Al Noor Mosque",
          "Al Bidya Mosque",
          "Sheikh Zayed Grand Mosque",
          "Jumeirah Mosque"
        ],
        correctAnswerIndex: 1,
      ),
      Question(
        question: "Who is the current ruler of Fujairah?",
        options: [
          "Sheikh Hamad bin Mohammed Al Sharqi",
          "Sheikh Saud bin Saqr Al Qasimi",
          "Sheikh Sultan bin Muhammad Al Qasimi",
          "Sheikh Humaid bin Rashid Al Nuaimi"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What is Fujairah famous for?",
        options: [
          "Beaches and historical sites",
          "Oil wealth",
          "Luxury lifestyle",
          "Mountains and adventure tourism"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        question: "What is the approximate size of Fujairah in square kilometers?",
        options: ["1,166", "2,590", "4,114", "260"],
        correctAnswerIndex: 0,
      ),
    ],
  };

  // Map that links each Emirate to a list of information
  static final Map<String, Information> infoPages = {
    "Abu Dhabi": Information(
      generalInfo:
      "Abu Dhabi, the largest emirate by area, was founded in the mid-18th century "
          "by the Bani Yas tribe led by the Al Nahyan family. "
          "It covers about 67,340 square kilometers and has a population of "
          "around 1.5 million. Geographically, it features vast deserts, islands, "
          "and a long coastline along the Arabian Gulf.",
      landmarks:
      "The Sheikh Zayed Grand Mosque, an architectural masterpiece, and the "
          "Louvre Abu Dhabi, a world-class museum, are key landmarks. "
          "The emirate also features the Corniche waterfront and Yas Island with "
          "its Formula 1 circuit.",
      currentRuler: "Sheikh Mohamed bin Zayed Al Nahyan",
      knownFor: "Oil wealth and cultural heritage",
    ),

    "Dubai": Information(
      generalInfo:
      "Dubai, founded in the early 19th century by the Al Maktoum family, is "
          "the most populous emirate with over 3 million residents. "
          "It spans approximately 4,114 square kilometers and is located on the "
          "Arabian Gulf coast, known for its desert landscape and urban "
          "development.",
      landmarks:
      "Burj Khalifa, the tallest building in the world, and the Palm Jumeirah, "
          "a man-made island shaped like a palm tree, are iconic. "
          "Dubai Mall and Dubai Marina are also major attractions.",
      currentRuler: "Sheikh Mohammed bin Rashid Al Maktoum",
      knownFor: "Tourism and luxury lifestyle",
    ),
    "Sharjah": Information(
      generalInfo:
      "Sharjah, founded in the 18th century and ruled by the Al Qasimi family, "
          "has a population of about 1.4 million and covers roughly 2,590 square "
          "kilometers. It lies on the Arabian Gulf coast and is known for its "
          "cultural and educational institutions.",
      landmarks:
      "The Sharjah Museum of Islamic Civilization and Al Noor Mosque are "
          "prominent cultural sites. The Heart of Sharjah project aims to "
          "preserve the emirate’s heritage.",
      currentRuler: "Sheikh Sultan bin Muhammad Al Qasimi",
      knownFor: "Cultural preservation and arts",
    ),

    "Fujairah": Information(
      generalInfo:
      "Fujairah is the only emirate located entirely on the Gulf of Oman coast, "
          "covering 1,166 square kilometers with a population of about 250,000. "
          "It has a mountainous terrain and a history rooted in fishing and trade.",
      landmarks:
      "Fujairah Fort and Al Bidya Mosque, the oldest mosque in the UAE, are "
          "important historical sites. The emirate is also known for its "
          "beaches and diving spots.",
      currentRuler: "Sheikh Hamad bin Mohammed Al Sharqi",
      knownFor: "Beaches and historical sites",
    ),

    "Ajman": Information(
      generalInfo:
      "Ajman is the smallest emirate, covering just 260 square kilometers, with "
          "a population of around 500,000. Founded in the early 19th century, "
          "it is located on the Arabian Gulf coast and has a mix of urban and "
          "coastal geography.",
      landmarks:
      "Ajman Fort and Ajman Museum highlight the emirate’s history. "
          "The Ajman Corniche is a popular seaside promenade.",
      currentRuler: "Sheikh Humaid bin Rashid Al Nuaimi",
      knownFor: "Traditional crafts and coastal charm",
    ),
    "Umm Al Quwain": Information(
      generalInfo:
      "Umm Al Quwain, one of the least populous emirates with about 72,000 "
          "residents, covers 770 square kilometers. It was founded centuries ago "
          "and is characterized by its coastal plains and islands along the "
          "Arabian Gulf.",
      landmarks:
      "Umm Al Quwain Fort and Dreamland Aqua Park are notable attractions. "
          "The emirate is known for its natural mangroves and wildlife reserves.",
      currentRuler: "Sheikh Saud bin Rashid Al Mualla",
      knownFor: "Natural landscapes and tranquility",
    ),
    "Ras Al Khaimah": Information(
      generalInfo:
      "Ras Al Khaimah, with a population of around 400,000, covers 1,684 square "
          "kilometers. It has a rich history dating back thousands of years and "
          "features diverse geography including mountains, deserts, and coastline.",
      landmarks:
      "Jebel Jais, the highest peak in the UAE, and Dhayah Fort are key "
          "landmarks. The emirate also has archaeological sites and beaches.",
      currentRuler: "Sheikh Saud bin Saqr Al Qasimi",
      knownFor: "Mountains and adventure tourism",
    ),
  };

  static final emirates = [
    Emirate(
      name: "Abu Dhabi",
      svgPath: "assets/icons/abu_dhabi_icon.svg",
      pageIndex: 1,
    ),

    Emirate(
      name: "Dubai",
      svgPath: "assets/icons/dubai_icon.svg",
      pageIndex: 2,
    ),

    Emirate(
      name: "Sharjah",
      svgPath: "assets/icons/sharjah_icon.svg",
      pageIndex: 3,
    ),

    Emirate(
      name: "Fujairah",
      svgPath: "assets/icons/fujairah_icon_v4.svg",
      pageIndex: 4,
    ),

    Emirate(
      name: "Ajman",
      svgPath: "assets/icons/ajman_icon.svg",
      pageIndex: 5,
    ),

    Emirate(
      name: "Umm Al Quwain",
      svgPath: "assets/icons/quwain_icon.svg",
      pageIndex: 6,
    ),

    Emirate(
      name: "Ras Al Khaimah",
      svgPath: "assets/icons/rak_icon_v2.svg",
      pageIndex: 7,
    ),


  ];

  static final Map<String, String> images = {
    "Abu Dhabi": "assets/images/ad_city.jpg",
    "Dubai": "assets/images/dubai_city.webp",
    "Sharjah": "assets/images/sharjah_mosque.jpg",
    "Fujairah": "assets/images/fujairah_coast.jpeg",
    "Ajman": "assets/images/ajman_fort.webp",
    "Umm Al Quwain": "assets/images/quwain_fort.jpeg",
    "Ras Al Khaimah": "assets/images/rak_city.jpg",
  };


}



