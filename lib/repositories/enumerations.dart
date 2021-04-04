  //https://ptyagicodecamp.github.io/dart-enums.html
  //enumeration and extension for ExerciseCategory
  enum ExerciseCategory {
    ABS, ARMS, BACK, CALVES, CHEST, LEGS, SHOULDERS, EVERYTHING
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