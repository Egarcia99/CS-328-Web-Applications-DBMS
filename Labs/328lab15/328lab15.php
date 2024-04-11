<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<!--
    trying PHP SimpleXML package and JSON extension

    by: Emilyo Garcia and Victor Diaz
    last modified: 2023-05-05

    you can run this using the URL:
    https://nrs-projects.humboldt.edu/~eg347/328lab15/328lab15.php
-->


<head>
    <title> PHP XML and JSON play </title>
    <meta charset="utf-8" />

    <link href="https://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />
</head>

<body>

<h1> Lab 15 problem 4 </h1>
<h2> Emilyo and Victor </h2>

<?php
    $myXmlNote = simplexml_load_file("lab15-1.xml");

    $to = $myXmlNote->to;
    $from = trim($myXmlNote->from);
?>

<?php

    $myJSONString = file_get_contents("lab15-2.json");

    $phpVersion1 = json_decode($myJSONString);

    $mother1 = $phpVersion1->{'Mother'};
    $father1 = $phpVersion1->{'Father'};
    $son1 = $phpVersion1->{'Son'};

    $phpVersion2 = json_decode($myJSONString, true);

    $mother2 = $phpVersion2['Mother'];
    $father2 = $phpVersion2['Father'];
    $son2 = $phpVersion2['Son'];
    ?>

    <ul>
<pre>
        <li> $phpVersion1->{'Mother'} is: [<?= $mother1 ?>] </li>
        <li> $phpVersion1->{'Father'} is: [<?= $father1 ?>] </li>
        <li> $phpVersion1->{'Son'} is: [<?= $son1 ?>] </li>
        <li> $phpVersion2['Mother'] is: [<?= $mother2 ?>] </li>
        <li> $phpVersion2['Father'] is: [<?= $father2 ?>] </li>
        <li> $phpVersion2['Son'] is: [<?= $son2 ?>] </li>
</pre>
    </ul>

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