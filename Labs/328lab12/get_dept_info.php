<?php   

function get_dept_info(){

  ?> 

<?php 


$username = $_SESSION['username'];
$password = $_SESSION['password'];
$answer = $_POST["dept_num_choice"];

// if (!isset($_POST['dept_num_choice'])){
//     require("dept_details.php");

// }

$conn = hsu_conn_sess($username, $password);

$statement = "select dept_loc, count(*), max(salary)
from dept d, empl e
where d.dept_num = e.dept_num
      and d.dept_num = :dept_num_choice
group by dept_loc";

$statement_parse = oci_parse($conn, $statement);
oci_bind_by_name($statement_parse,":dept_num_choice", $answer);
oci_execute($statement_parse, OCI_DEFAULT);
oci_fetch($statement_parse);

$curr_dep = oci_result($statement_parse,1);
$curr_det = oci_result($statement_parse,2);
$curr_dt = oci_result($statement_parse,3);

?> 

<p> The department is located at : <?=$curr_dep?> and there are <?= $curr_det?> staff working that make about <?=$curr_dt?> money</p>
<form action="dept_details.php">
  <button type="submit">Return to Page</button>
</form>

<?php 
}
?>



