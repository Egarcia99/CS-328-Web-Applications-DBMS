<?php
    /*==
        by: Emilyo Garcia 
        last modified: 04/28/2023
    ==*/
        
        require_once("hsu_conn_sess.php");
        require_once("login_form.php");
       
       


    function total_cost()
    {
        $username = $_SESSION["name"];


        $password = $_SESSION["password"];

        $conn = hsu_conn_sess($username, $password);
        $desired_isbn = strip_tags($_POST["title"]);

        $total_cost_str = "BEGIN :result_var := title_total_cost(:desired_isbn); END;";

        $total_cost_stmt = oci_parse($conn, $total_cost_str);


        oci_bind_by_name($total_cost_stmt, ":desired_isbn",
                         $desired_isbn);
                        
        oci_bind_by_name($total_cost_stmt, ":result_var",
                         $sum, 4);

         oci_execute($total_cost_stmt, OCI_DEFAULT);
         
        ?>
        <p> Total Cost On Hand <?= $sum ?>, Desired ISBN: <?= $desired_isbn?> </p>    
        <?php
         oci_free_statement($total_cost_stmt);
         oci_close($conn);
    }
?>