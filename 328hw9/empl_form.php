<?php
    /*==
        by: Emilyo Garcia
        last modified: 04/28/2023
     ==*/

    require_once("hsu_conn_sess.php");
    require_once("login_form_1.php");

    function empl_form()
    {
        
        if ($_SERVER["REQUEST_METHOD"] == "GET")
        {
        
            session_destroy();
            login_form_1();
        
        }
        else
        {
        ?>
        <form method="post"
              action="<?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>">

        <fieldset>
        <legend> Enter Employee Name and Raise Percentage </legend>
        <?php
        $username = strip_tags($_POST["username"]);
        $_SESSION["name"] = $username;


        $password = $_POST["password"];
        $_SESSION["password"] = $password;

        $conn = hsu_conn_sess($username, $password);

        $empl_str = "select empl_fname, empl_lname from Employee order by empl_fname";

        $empl_stmt = oci_parse($conn, $empl_str);

        oci_execute($empl_stmt, OCI_DEFAULT);
        ?>
        <select name ="Empl">
        
        <?php

        while(oci_fetch($empl_stmt))
        {
            $curr_empl_fname = oci_result($empl_stmt, 1);
            $curr_empl_lname = oci_result($empl_stmt, 2);
            ?>
            <option value = "<?= $curr_empl_fname ?>" > <?="Employee: ".$curr_empl_fname." , ".$curr_empl_lname ?> </option>    

            <?php

        }
        ?>
        
        </select>

     
        <label for="raise_entry"> Raise Percent: </label>
        <input type="number"  step="0.01" min ="0.01" max = "0.05" name="<?= "raise_percent" ?>" id="raise_entry" 
               required="required" />

        </fieldset>

        <div class="submit">
            <input type="submit" value="submit" />
        </div>
        </form>
        <?php
        oci_free_statement($empl_stmt);
        oci_close($conn);
    }
    }

?>