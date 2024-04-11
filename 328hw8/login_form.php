<?php
    /*=====
        by: Emilyo Garcia
        last modified: 04/28/2023
    =====*/

?>
<?php
    function login_form()
    {
        ?>
        <form method="post"
              action="<?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>">
        <fieldset>
        <legend> Enter Oracle username/password: </legend>

        <label for="name_entry"> Username: </label>
        <input type="text" name="<?= "username" ?>" id="name_entry"
               required="required" /> 

        <label for="pwd_entry"> Password: </label>
        <input type="password" name="<?= "password" ?>" id="pwd_entry" 
               required="required" />
        <label for="pub_entry"> Publisher Name: </label>
        <input type="text" name="<?= "publisher" ?>" id="pub_entry"
                required="required" />
        </fieldset>
        </div>

        <div class="submit">
                <input type="submit" />

        </div>
        </form>


        <?php
    
        
    }
?>
