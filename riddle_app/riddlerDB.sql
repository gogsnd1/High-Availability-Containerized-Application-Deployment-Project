/* table to hole difficulty levels and be able to reference questions with them */
CREATE TABLE IF NOT EXISTS difficultyLevel (
	difficultyID SERIAL PRIMARY KEY NOT NULL,
	difficultyName VARCHAR(20) UNIQUE NOT NULL --easy, medium, hard
);
/* table to store the questions */
CREATE TABLE IF NOT EXISTS Question (
	questionID SERIAL PRIMARY KEY NOT NULL,
	title VARCHAR(100) NOT NULL,
	question TEXT NOT NULL,
	difficultyID INT REFERENCES difficultyLevel(difficultyID)
);

/* table to store the answers */
CREATE TABLE IF NOT EXISTS Answer (
    answerID SERIAL PRIMARY KEY NOT NULL,
    questionID INT REFERENCES Question(questionID) ON DELETE CASCADE,
    answer VARCHAR(255) NOT NULL
);

