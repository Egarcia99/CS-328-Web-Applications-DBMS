<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<!-- Emilyo Garcia
     CS 328 Homework 6 Problem 1 
     LMD: 04/01/2023 
     URL: http://nrs-projects.humboldt.edu/~eg347/328hw6-1.php -->

<head>
    <title>328 HW 6 Problem 1 </title>
    <meta charset="utf-8" />

    <link href="http://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />
</head>

<body>

<?php
    if ($_SERVER["REQUEST_METHOD"] == "GET") 
    {
    ?>



<form method="post"
          action="http://nrs-projects.humboldt.edu/~eg347/328hw6-1.php">


<h1> CS 328 Homework 6 Problem 1 </h1>

<h2> Emilyo Garcia </h2>

<form>


    <fieldset>
        <legend>What is your Favorite Number?</legend>
        <input type="number" name="number" placeholder="number"/>
    </fieldset>

    <fieldset>
    <label for="fav_hw">What is your Favorite Homework Assignment</label>
                <select name="homework" id="fav_hw">
                    <option value="hw_1"> Homework 1 </option>
                    <option value="hw_2"> Homework 2 </option>
                    <option value="hw_3"> Homework 3 </option>          
                    <option value="hw_4"> Homework 4 </option>
                    <option value="hw_5"> Homework 5 </option>
                    <option value="hw_6"> Homework 6 </option>
                </select> <br />
    </fieldset>
    
    <input type="submit" value="submit"/>
    </form>

    <?php
    }
    else
    {
        ?> 
            <p>  This is your Favorite Number! <?=htmlspecialchars ($_POST["number"]) ?>. </p>
            <p>  This is your Favorite Homework Assignment! <?=htmlspecialchars ($_POST["homework"]) ?>. </p> 
            <p> Lets Square Your Number for Fun! <?=htmlspecialchars ($_POST["number"] * $_POST["number"]) ?> </p> </br>

            <a href="http://nrs-projects.humboldt.edu/~eg347/328hw6-1.php"> Go Back to Original Webpage here </a>

    <?php
    }
    ?>

 
    <footer>
    <hr />
    <p>
        Validate by pasting .xhtml copy's URL into<br />
        <a href="https://html5.validator.nu/">
            https://html5.validator.nu/
        </a>
    </p>
    </footer>
    </body>
    </html>