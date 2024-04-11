
<?php
function create_dropdown(){





if (isset($_POST['username']) && isset($_POST['password'])) {

    
    $_SESSION['username'] = $_POST['username'];
    $_SESSION['password'] = $_POST['password'];

    $username = strip_tags($_POST["username"]);
$password = $_POST["password"];

   $con = hsu_conn_sess($username, $password);

$db_conn_str = "select dept_name, dept_num
            from dept";

 $statement = oci_parse($con, $db_conn_str);
 oci_execute($statement, OCI_DEFAULT);

?>

<form method="post"
              action=" <?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>">
    <label for="dept_num_choice">Choose a Department Number:</label>
    <select name="dept_num_choice" id="dept_num"> 
<?php

        while(oci_fetch($statement)){

             $curr_dept = oci_result($statement,1); 
             $dept_num= oci_result( $statement, 2)?>
             
                <option value= <?=$dept_num?>><?=$curr_dept?></option><?php
  

}
?>
   </select>
    <div class="submit">
    <input type="submit" value="Make changes" />
    </div>
<form>

<?php

}

}
?>
