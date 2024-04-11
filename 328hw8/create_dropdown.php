<?php
    /*==
        by: Emilyo Garcia
        last modified: 04/28/2023
    ==*/
    
        /* bring in some needed PHP functions */
        
        require_once("hsu_conn_sess.php");
        require_once("login_form.php");
       
       


    function create_dropdown()
    {
        
        if ($_SERVER["REQUEST_METHOD"] == "GET")
        {
            session_destroy();
            login_form_1();
        
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

        $conn = hsu_conn_sess($username, $password);

        $title_str = "select ttl_name, ttl_isbn from title order by ttl_name";

        $title_stmt = oci_parse($conn, $title_str);

        oci_execute($title_stmt, OCI_DEFAULT);
        ?>
        <select name ="title">
        
        <?php

        while(oci_fetch($title_stmt))
        {
            $curr_ttl = oci_result($title_stmt, 1);
            $curr_isbn = oci_result($title_stmt, 2);
            ?>
            <option value = "<?= $curr_isbn ?>" > <?="ISBN-".$curr_isbn." , Title ".$curr_ttl ?> </option>    

            <?php

        }
        ?>
        
        </select>

        <input type="submit" value="submit" />
        </form>
        <?php
        oci_free_statement($title_stmt);
        oci_close($conn);
    }
    }
?>