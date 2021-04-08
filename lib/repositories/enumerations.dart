//https://ptyagicodecamp.github.io/dart-enums.html
//enumeration and extension for ExerciseCategory
import 'dart:convert';

enum ExerciseCategory {
  ABS,
  ARMS,
  BACK,
  CALVES,
  CHEST,
  LEGS,
  SHOULDERS,
  EVERYTHING
}

extension ExerciseCategoryExt on ExerciseCategory {
  static const categoryMap = {
    ExerciseCategory.ARMS: 8,
    ExerciseCategory.LEGS: 9,
    ExerciseCategory.ABS: 10,
    ExerciseCategory.CHEST: 11,
    ExerciseCategory.BACK: 12,
    ExerciseCategory.SHOULDERS: 13,
    ExerciseCategory.CALVES: 14,
    ExerciseCategory.EVERYTHING: 15
  };
}

//muscle list for further reference
final List<Map<String, dynamic>> musclesList = [
  {
    "id": 2,
    "name": "Anterior deltoid",
    "is_front": true,
    "image_url_main": "/static/images/muscles/main/muscle-2.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-2.svg"
  },
  {
    "id": 1,
    "name": "Biceps brachii",
    "is_front": true,
    "image_url_main": "/static/images/muscles/main/muscle-1.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-1.svg"
  },
  {
    "id": 11,
    "name": "Biceps femoris",
    "is_front": false,
    "image_url_main": "/static/images/muscles/main/muscle-11.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-11.svg"
  },
  {
    "id": 13,
    "name": "Brachialis",
    "is_front": true,
    "image_url_main": "/static/images/muscles/main/muscle-13.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-13.svg"
  },
  {
    "id": 7,
    "name": "Gastrocnemius",
    "is_front": false,
    "image_url_main": "/static/images/muscles/main/muscle-7.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-7.svg"
  },
  {
    "id": 8,
    "name": "Gluteus maximus",
    "is_front": false,
    "image_url_main": "/static/images/muscles/main/muscle-8.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-8.svg"
  },
  {
    "id": 12,
    "name": "Latissimus dorsi",
    "is_front": false,
    "image_url_main": "/static/images/muscles/main/muscle-12.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-12.svg"
  },
  {
    "id": 14,
    "name": "Obliquus externus abdominis",
    "is_front": true,
    "image_url_main": "/static/images/muscles/main/muscle-14.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-14.svg"
  },
  {
    "id": 4,
    "name": "Pectoralis major",
    "is_front": true,
    "image_url_main": "/static/images/muscles/main/muscle-4.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-4.svg"
  },
  {
    "id": 10,
    "name": "Quadriceps femoris",
    "is_front": true,
    "image_url_main": "/static/images/muscles/main/muscle-10.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-10.svg"
  },
  {
    "id": 6,
    "name": "Rectus abdominis",
    "is_front": true,
    "image_url_main": "/static/images/muscles/main/muscle-6.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-6.svg"
  },
  {
    "id": 3,
    "name": "Serratus anterior",
    "is_front": true,
    "image_url_main": "/static/images/muscles/main/muscle-3.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-3.svg"
  },
  {
    "id": 15,
    "name": "Soleus",
    "is_front": false,
    "image_url_main": "/static/images/muscles/main/muscle-15.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-15.svg"
  },
  {
    "id": 9,
    "name": "Trapezius",
    "is_front": false,
    "image_url_main": "/static/images/muscles/main/muscle-9.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-9.svg"
  },
  {
    "id": 5,
    "name": "Triceps brachii",
    "is_front": false,
    "image_url_main": "/static/images/muscles/main/muscle-5.svg",
    "image_url_secondary": "/static/images/muscles/secondary/muscle-5.svg"
  }
];

//equipment list for further reference
final List<Map<String, dynamic>> equipmentList = [
    {
      "id": 1,
      "name": "Barbell"
    },
    {
      "id": 2,
      "name": "SZ-Bar"
    },
    {
      "id": 3,
      "name": "Dumbbell"
    },
    {
      "id": 4,
      "name": "Gym mat"
    },
    {
      "id": 5,
      "name": "Swiss Ball"
    },
    {
      "id": 6,
      "name": "Pull-up bar"
    },
    {
      "id": 7,
      "name": "None"
    },
    {
      "id": 8,
      "name": "Bench"
    },
    {
      "id": 9,
      "name": "Incline bench"
    },
    {
      "id": 10,
      "name": "Kettlebell"
    }
  ];