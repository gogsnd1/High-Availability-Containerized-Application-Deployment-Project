from flask import Flask, jsonify
import psycopg2
import random

app = Flask(__name__)

DB_CONFIG = {
    "dbname": "riddlerdb",
    "user": "postgres",
    "password": "1234",
    "host": "localhost",
    "port": 5432
}

@app.route('/riddle')
def get_riddle():
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cursor = conn.cursor()

        # Get a random question
        cursor.execute('''
            SELECT q.questionID, q.question
            FROM question q
            ORDER BY RANDOM()
            LIMIT 1
        ''')
        row = cursor.fetchone()
        if not row:
            return jsonify({"error": "No questions found"}), 404

        question_id, question_text = row

        # Get the answer(s) for that question
        cursor.execute('''
            SELECT answer
            FROM Answer
            WHERE questionID = %s
        ''', (question_id,))
        answers = [r[0] for r in cursor.fetchall()]

        cursor.close()
        conn.close()

        return jsonify({
            "question": question_text,
            "answers": answers
        })

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
