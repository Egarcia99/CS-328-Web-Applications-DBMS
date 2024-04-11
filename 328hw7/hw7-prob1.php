<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<!-- Edited by: Emilyo Garcia
     Created by: Sharon Tuttle
     CS 328 Homework 7 Problem 1 
     LMD: 04/07/2023 
     URL: http://nrs-projects.humboldt.edu/~eg347/hw7.php/hw7-prob1.php -->

<head>
    <title>328 HW 7 Problem 1 </title>
    <meta charset="utf-8" />

    <link href="http://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />
    <link href="hw7-prob1.css" type="text/css" rel="stylesheet" />
</head>

<body>

<h1> CS 328 Homework 7 Problem 1 </h1>

<h2> Emilyo Garcia </h2>

<h3> Galatical Databases </h3>

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

        $bks_query = " select pub_id, pub_name, pub_city, pub_state, pub_min_for_disc
                       from publisher
                       order by pub_name";
                    
        $bks_stmt = oci_parse($conn, $bks_query);

        oci_execute($bks_stmt, OCI_DEFAULT);
        ?>

        <?php
        while (oci_fetch($bks_stmt))
        {
            $curr_pub_id = oci_result($bks_stmt, 1);
            $curr_pub_name = oci_result($bks_stmt, 2); 
            $curr_pub_city = oci_result($bks_stmt, 3);
            $curr_pub_state = oci_result($bks_stmt, 4);
            $curr_pub_min_for_disc = oci_result($bks_stmt, 5);

            if ($curr_pub_min_for_disc === NULL)
            {
                $curr_pub_min_for_disc = "No minimum value";
            }
            ?>

            <ol>
                <li> <?= $curr_pub_id ?> </li>
                <li> <?= $curr_pub_name ?> </li>
                <li> <?= $curr_pub_city ?> </li>
                <li> <?= $curr_pub_state?> </li>
                <li> <?= $curr_pub_min_for_disc ?> </li>
            </ol>

            <a href="http://nrs-projects.humboldt.edu/~eg347/hw7.php/hw7-prob1.php"> Go Back to Original Webpage here </a>
            <?php
        }
        ?>

        <?php
        // FREE your statement, CLOSE YOUR CONNECTION!!!!!!

        oci_free_statement($bks_stmt);

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