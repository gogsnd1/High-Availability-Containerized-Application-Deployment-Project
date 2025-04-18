/* table to store the questions */
CREATE TABLE Question {
    questionID SERIAL PRIMARY KEY NOT NULL;
    title VARCHAR(100) NOT NULL;
    question TEXT NOT NULL;
    difficultyID INT REFERENCES difficultyLevel(difficultyID);
}

/* table to store the answers */
CREATE TABLE Answer {
    answerID SERIAL PRIMARY KEY NOT NULL;
    questionID INT REFERENCES Question(questionID) ON DELETE CASCADE;
    answer VARCHAR(255) NOT NULL;
}

/* table to hold difficulty levels and be able to reference questions with them */
CREATE TABLE difficultyLevel {
    difficultyID SERIAL PRIMARY KEY;
    difficultyName VARCHAR(20) UNIQUE NOT NULL --easy, medium, hard
}
