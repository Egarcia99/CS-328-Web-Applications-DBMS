<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<!--
    by: Emilyo Garcia
    last modified: 04/28/2023

    you can run this using the URL: http://nrs-projects.humboldt.edu/~eg347/328hw9/hw9-custom.php -->

<head>
    <title> CS 328 HW 9 Problem 5 </title>
    <meta charset="utf-8" />
    <?php
        
        require_once("login_form_1.php");
        require_once("empl_form.php");
        require_once("call_empl_raise.php");
    ?>
    <link href="https://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />

    <link href="custom.css" type="text/css" rel="stylesheet" />

    <script src="Best_employee.js" type="text/javascript" 
            defer="defer"></script>
</head>

<body>
<h1> CS 328 HW 9 Problem 5 </h1>
<h2> Emilyo Garcia </h2>
<h3> Pet Store Databases</h3>
    <?php
    
    
     if (! array_key_exists("next_step", $_SESSION))
    {
        login_form_1();
        $_SESSION["next_step"] = "empl_form";
    }
    elseif ($_SESSION["next_step"] == "empl_form")
    {
        empl_form();
        $_SESSION["next_step"] = "empl_raise";

    }
    elseif($_SESSION["next_step"] == "empl_raise")
    {
        empl_raise();
        session_destroy();
        ?>
        <p><a href="http://nrs-projects.humboldt.edu/~eg347/328hw9/hw9-custom.php">
        Return to Main Page Here </a> </p> </br>
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