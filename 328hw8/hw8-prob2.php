<?php

    session_start();
?>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">


<!--
    by: Emilyo Garcia
    last modified: 04/28/2023

    you can run this using the URL: http://nrs-projects.humboldt.edu/~eg347/328hw8/hw8-prob2.php -->

<head>
    <title> CS 328 HW Problem 2 </title>
    <meta charset="utf-8" />
    <?php
        
        require_once("login_form_1.php");
        require_once("create_dropdown.php");
        require_once("call_pl_sql_func.php");
    ?>
    <link href="https://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />
    <link href="bks.css" type="text/css" rel="stylesheet" />

</head>

<body>
<h1> CS 328 HW Problem 2 </h1>
<h2> Emilyo Garcia </h2>
<h3> Galatical Databases </h3>
    <?php
    
    
     if (! array_key_exists("next_stage", $_SESSION))
    {
        login_form_1();
        $_SESSION["next_stage"] = "create_dropdown";
    }
    elseif ($_SESSION["next_stage"] == "create_dropdown")
    {
        create_dropdown();
        $_SESSION["next_stage"] = "pl/sql_funct";

    }
    elseif($_SESSION["next_stage"] == "pl/sql_funct")
    {
        total_cost();
        session_destroy();
        ?>
        <p><a href="http://nrs-projects.humboldt.edu/~eg347/328hw8/hw8-prob2.php">
        Return To Main Page Here </a> </p> </br>
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