<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Quiz Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        main {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        p {
            margin-top: 0;
            margin-bottom: 8px;
        }

        .answer-options {
            margin-bottom: 16px;
        }

        .answer-options label {
            display: block;
            margin-bottom: 8px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            margin-bottom: 16px;
        }

        .results {
            margin-top: 20px;
        }

        .new-question-button {
            background-color: #4285f4;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<?php
// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "answers";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Initialize variables
$question = $answer1 = $answer2 = $correctAnswer = "";
$showResults = false;

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process the form data
    $question = $_POST["question"];
    $answer1 = $_POST["answer1"];
    $answer2 = $_POST["answer2"];
    $correctAnswer = $_POST["correctAnswer"];
    $showResults = true;

    // Insert the question, answers, and correct answer into the database
    $sql = "INSERT INTO quiz_data (question, answer1, answer2, correctAnswer) VALUES ('$question', '$answer1', '$answer2', '$correctAnswer')";

    if ($conn->query($sql) !== TRUE) {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>

<main>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <label for="question">Jautajums:</label>
        <input type="text" id="question" name="question" required>

        <label for="answer1">Atbilde 1:</label>
        <input type="text" id="answer1" name="answer1" required>

        <label for="answer2">Atbilde 2:</label>
        <input type="text" id="answer2" name="answer2" required>

        <p>Pareizā atbilde:</p>
        <div class="answer-options">
            <label>
                <input type="radio" name="correctAnswer" value="answer1" required> Atbilde 1
            </label>
            <label>
                <input type="radio" name="correctAnswer" value="answer2" required> Atbilde 2
            </label>
        </div>

        <button type="submit">Iesniegt</button>
    </form>

    <div class="results" style="display: <?php echo $showResults ? 'block' : 'none'; ?>">
        <p><strong>Jautājums:</strong> <?php echo $question; ?></p>
        <p><strong>Atbilde 1:</strong> <?php echo $answer1; ?></p>
        <p><strong>Atbilde 2:</strong> <?php echo $answer2; ?></p>
        <p><strong>Pareizā atbilde:</strong> <?php echo $correctAnswer === 'answer1' ? $answer1 : $answer2; ?></p>
    </div>

    <button class="new-question-button" onclick="resetForm()">Jauns jautājums</button>
</main>

<script>
    function resetForm() {
        document.getElementById("question").value = "";
        document.getElementById("answer1").value = "";
        document.getElementById("answer2").value = "";
        
        var radioButtons = document.querySelectorAll('input[name="correctAnswer"]');
        radioButtons.forEach(function(button) {
            button.checked = false;
        });

        // Hide the results and display the form
        document.querySelector('.results').style.display = 'none';
        document.querySelector('form').style.display = 'block';
        document.querySelector('.new-question-button').style.display = 'none';
    }
</script>

</body>
</html>
