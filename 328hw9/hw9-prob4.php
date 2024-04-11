<?php
    /*---
        NEEEEEED this to use PHP sessions!
        put at the BEGINNING of each PHP document using $_SESSION
    ---*/

    session_start();
?>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<!-- class HTML template: last modified 2023-03-29 -->

<!--
    by: Emilyo Garcia
    last modified: 2023-4-20

    you can run this using the URL: http://nrs-projects.humboldt.edu/~eg347/328hw9/hw9-prob4.php -->

<head>
    <title> CS 328 HW 9 Problem 4 </title>
    <meta charset="utf-8" />
    <?php
        
        require_once("login_form.php");
        require_once("pub_select.php");
    ?>
    <link href="https://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />
    <link href="bks.css" type="text/css" rel="stylesheet" />
       
    <script src="sayHello.js" type="text/javascript" 
            defer="defer"></script>


</head>

<body>
    <h1> CS 328 HW 9 Problem 4 </h1>
    <h2> Emilyo Garcia </h2>
    <h3> Galatical Databases </h3>
    <?php
    
    
     if (! array_key_exists("next_state", $_SESSION))
    {
        login_form();
        $_SESSION["next_state"] = "pub_select";
    }
    elseif ($_SESSION["next_state"] == "pub_select")
    {
        pub_select();
        session_destroy();
        ?>
        <p><a href="http://nrs-projects.humboldt.edu/~eg347/328hw9/hw9-prob4.php">
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