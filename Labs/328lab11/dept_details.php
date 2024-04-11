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
    by:
    last modified: https://nrs-projects.humboldt.edu/~vmd21/Labwork/328lab11/dept_details.php


    you can run this using the URL:
c
-->

<head>
    <title> page title here </title>
    <meta charset="utf-8" />

    <?php
include("hsu_conn_sess.php");
require_once("create_dropdown.php");
require_once("get_dept_info.php");
?>
   

    <link href="https://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />

</head>



<body>
<?php 

if ($_SERVER["REQUEST_METHOD"] == "GET")
{
    require_once("name-pwd-feildset.php");
    $_SESSION['count'] = 1;
}
else if($_SESSION['count'] == 1){
    $_SESSION['count'] = 2;
    create_dropdown();
    
}
else if( $_SESSION['count'] == 2){
get_dept_info();
}
else{
    session_destroy();
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