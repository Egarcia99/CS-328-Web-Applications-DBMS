<?php
    /*==
        by: Emilyo Garcia 
        last modified: 04/28/2023
    ==*/
        
        require_once("hsu_conn_sess.php");
        


    function empl_raise()
    {
        $username = $_SESSION["name"];

        $password = $_SESSION["password"];

        $conn = hsu_conn_sess($username, $password);

        $desired_empl = strip_tags($_POST["Empl"]);

        $desired_raise_percent = strip_tags($_POST["raise_percent"]);

        $empl_raise_str = "BEGIN employee_raise(:empl_fname , :raise_amt); END;";
        $empl_raise_stmt = oci_parse($conn, $empl_raise_str);


        oci_bind_by_name($empl_raise_stmt, ":empl_fname",
                         $desired_isbn);
                        
        oci_bind_by_name($empl_raise_stmt, ":raise_amt",
                         $desired_raise_percent);

         oci_execute($empl_raise_stmt, OCI_DEFAULT);
         
        ?>
        <p> empl_raise called </br> 
            employee: <?= $desired_empl ?> Recieved a </br>
            raise of: <?= $desired_raise_percent?>%. </p> 


        </p>   
         
        <?php
         oci_free_statement($empl_raise_stmt);
         oci_close($conn);
    }
?>