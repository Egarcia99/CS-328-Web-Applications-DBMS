<?php
    /*==
        by: Emilyo Garcia
        last modified: 04/28/2023
    ==*/
        
        require_once("hsu_conn_sess.php");
        require_once("login_form.php");

    function pub_select()
    {
        
        if ($_SERVER["REQUEST_METHOD"] == "GET")
        {

            session_destroy();
            login_form();
        
        }
        else {
        ?>
        <form method="post"
              action="<?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>">
        <?php

       $username = strip_tags($_POST["username"]);
       $_SESSION["name"] = $username;

        $password = $_POST["password"];
        $_SESSION["password"] = $password;

        $publisher = strip_tags($_POST["publisher"]);

        $conn = hsu_conn_sess($username, $password);

        $pub_str = "select pub_city, pub_state 
                    from publisher 
                    where pub_name = :pub_name_choice";

        $pub_stmt = oci_parse($conn, $pub_str);

        oci_bind_by_name($pub_stmt, ":pub_name_choice", $publisher);
            
        oci_execute($pub_stmt, OCI_DEFAULT);
        ?>
        <table>
        <caption> Publisher Selected Info </caption>
        <tr> <th scope="col"> Pub City</th>
             <th scope="col"> Pub State</th>
        </tr>
            
        <?php 
            
         while (oci_fetch($pub_stmt))
        {
            
                $curr_city = oci_result($pub_stmt, 1);     
                $curr_state = oci_result($pub_stmt, 2);          
                 ?>
            <tr> 
            <td> <?= $curr_city ?> </td>
            <td> <?= $curr_state ?> </td>
            </tr>
            <?php
        }
            ?>
            </table>
                    
            </form>
        <?php
        oci_free_statement($pub_stmt);
        oci_close($conn);
    }
    }
?>