<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<!-- Edited by: Emilyo Garcia
     Created by: Sharon Tuttle
     CS 328 Homework 7 Problem 2 
     LMD: 04/07/2023 
     URL: http://nrs-projects.humboldt.edu/~eg347/hw7.php/hw7-prob2.php -->

<head>
    <title>328 HW 7 Problem 2 </title>
    <meta charset="utf-8" />

    <link href="http://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />
    <link href="hw7-prob2.css" type="text/css" rel="stylesheet" />
</head>

<body>

<h1> CS 328 Homework 7 Problem 2 </h1>

<h2> Emilyo Garcia </h2>

<h3> Pet Store Database </h3>

<?php
    // do you need to ask for username and password?

    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        ?>

        <form method="post"
              action="<?= htmlentities($_SERVER['PHP_SELF'],
                                        ENT_QUOTES) ?>">
        <fieldset>
            <legend> Please enter Oracle username/password:
                </legend>

            <label for="username"> Username: </label>
            <input type="text" name="username" id="username" 
                   required="required" />

            <label for="password"> Password: </label>
            <input type="password" name="password"
                   id="password" required="required" />

            <div class="submit">
                <input type="submit" value="Log in" />
            </div>
        </fieldset>
        </form>
    <?php
    }

    else
    {

        $username = strip_tags($_POST["username"]);
        $password = $_POST["password"];


        $db_conn_str = "(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)
                                           (HOST = cedar.humboldt.edu)
                                           (PORT = 1521))
                                       (CONNECT_DATA = (SID = STUDENT)))";
        
        $conn = oci_connect($username, $password, $db_conn_str);

        // exiting if can't log in

        if (! $conn)
        {
            ?>
            <p> Could not log into Oracle, sorry </p>

            <?php

            require_once("328footer-plus-end.html");
            exit;
        }

        $pet_store_query = " select pet_id, pet_name, breed, food, age
                       from pet
                       order by pet_name";
                    
        $pet_store_stmt = oci_parse($conn, $pet_store_query);

        oci_execute($pet_store_stmt, OCI_DEFAULT);
        ?>

        <?php
        while (oci_fetch($pet_store_stmt))
        {
            $curr_pet_id = oci_result($pet_store_stmt, 1);
            $curr_pet_name = oci_result($pet_store_stmt, 2); 
            $curr_breed = oci_result($pet_store_stmt, 3);
            $curr_food = oci_result($pet_store_stmt, 4);
            $curr_age = oci_result($pet_store_stmt, 5);

            if ($curr_age === NULL)
            {
                $curr_age = "No age found";
            }
            ?>

            <ol>
                <li> <?= $curr_pet_id ?> </li>
                <li> <?= $curr_pet_name ?> </li>
                <li> <?= $curr_breed ?> </li>
                <li> <?= $curr_food?> </li>
                <li> <?= $curr_age ?> </li>
            </ol>

            <a href="http://nrs-projects.humboldt.edu/~eg347/hw7.php/hw7-prob2.php"> Go Back to Original Webpage here </a>
            <?php
        }
        ?>

        <?php
        // FREE your statement, CLOSE YOUR CONNECTION!!!!!!

        oci_free_statement($pet_store_stmt);

        oci_close($conn);
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