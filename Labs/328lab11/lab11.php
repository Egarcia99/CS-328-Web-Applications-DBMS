<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<!--
demo connecting from PHP on nrs-projects
to the Oracle student database on cedar

adapted from an example by Peter Johnson
adapted by: Sharon Tuttle
Edited by : Victor Diaz and Emilyo Garcia
last modified: 2023-03-29

you can run this using the URL:
https://nrs-projects.humboldt.edu/~eg347/328lab11/lab11.php
-->

<head>
<title> CS 328 Lab 11 </title>
<meta charset="utf-8" />

<?php

require_once("make_empl_form.php");

?>

<link href=
"https://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
type="text/css" rel="stylesheet" />

<link href="try-oracle.css" type="text/css" rel="stylesheet" />
</head>

<body>
<h1> Application for Rapper Form </h1>
<h2> Victor Diaz and Emilyo Garcia </h2>
<?php
// do you need to ask for username and password?

if ($_SERVER["REQUEST_METHOD"] == "GET")
{
// request was method get rather than post?
// they need a login form!
make_empl_form();

}

else
{

$empl_term = strip_tags($_POST["empl_to_term"]);
$empl_raise = strip_tags($_POST["empl_for_raise"]);
$raise_amt = strip_tags($_POST["raise_amount"]);

$username = strip_tags($_POST["username"]);
$password = $_POST["password"];
$db_conn_str = "(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)
(HOST = cedar.humboldt.edu)
(PORT = 1521))
(CONNECT_DATA = (SID = STUDENT)))";
$conn = oci_connect($username, $password, $db_conn_str);

if (! $conn)
{
?>
<p> Could not log into Oracle, sorry! </p>
<?php
require_once("328footer-plus-end.html");
exit;
}

else{
$count_empl = "begin :ct := count_empl(:noodle); end;";
$count_empl_stmt = oci_parse($conn, $count_empl);
oci_bind_by_name($count_empl_stmt, ":noodle", $empl_term);
oci_bind_by_name($count_empl_stmt,":ct", $count_num,2);
oci_execute($count_empl_stmt, OCI_DEFAULT);
oci_commit($conn);

if ($count_num == 1){



$terminate_empl = "begin terminate_empl(:noodle); end;";
$terminate_empl_stmt = oci_parse($conn, $terminate_empl);

oci_bind_by_name($terminate_empl_stmt,":noodle", $empl_term);
oci_execute($terminate_empl_stmt, OCI_DEFAULT);
oci_commit($conn);
oci_free_statement($terminate_empl_stmt);
?>
<p>The Employee <strong><?= $empl_term ?></strong> Has been terminated </p>
<?php
}

elseif($count_num == 0) {

?>
<p>The Employee <strong><?= $empl_term ?></strong> Does not work here </p>
<?php

}


else{

?>
<p>There is more than one employee nammed <strong><?= $empl_term ?></strong> </p>
<?php
}



$count_empl = "begin :ct := count_empl(:noodle); end;";
$count_empl_stmt = oci_parse($conn, $count_empl);
oci_bind_by_name($count_empl_stmt, ":noodle", $empl_raise);
oci_bind_by_name($count_empl_stmt,":ct", $count_num,3);
oci_execute($count_empl_stmt, OCI_DEFAULT);
oci_commit($conn);

if ($count_num >= 1){


$raise_empl = "begin :up := Update_salary( :noodle , :raise_ ); end;";
$raise_empl_stmt = oci_parse($conn, $raise_empl);
oci_bind_by_name($raise_empl_stmt, ":noodle", $empl_raise);
oci_bind_by_name($raise_empl_stmt, ":raise_", $raise_amt);
oci_bind_by_name($raise_empl_stmt,":up", $update_ ,10);
oci_execute($raise_empl_stmt, OCI_DEFAULT);
oci_commit($conn);
?>

<p> The employee named: <?=$empl_raise?> got a raise of <?= $raise_amt ?> and now makes <strong>
<?= $update_ ?> </strong> </p>
<?php
oci_free_statement($raise_empl_stmt);
oci_free_statement($count_empl_stmt);

}
else{

?>
<p> no employee with That name<strong>
<?= $empl_term ?> </strong> </p>
<?php
}
}


// FREE my statement, CLOSE my connection
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