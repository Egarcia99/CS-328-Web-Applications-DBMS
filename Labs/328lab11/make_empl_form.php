<?php
    /*===
        function: make_empl_form: void -> void
        purpose: expects nothing, returns nothing, but has the
            side effect of outputting to the results document
            a lovely form requesting a username, password,
            last name of employee to terminate, last name of
            employee to give raise, and percentage amount of that
            raise

        last modified: 2023-04-06
    ===*/

    function make_empl_form()
    {
        ?>
    <form method="post"
              action="<?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>">
        <fieldset>
            <fieldset>
                <legend> Enter Oracle username/password:
                    </legend>

                <label for="user_name"> Username: </label>
                <input type="text" name="username" id="user_name" /><br />

                <label for="pass_word"> Password: </label>
                <input type="password" name="password"
                       id="pass_word" /> <br />
            </fieldset>
            <fieldset>
                <legend> Enter employee info </legend>

                <label for="empl_term"> Last name of employee to terminate: </label>
                <input type="text" name="empl_to_term" id="empl_term" /><br />

                <label for="empl_raise"> Last name of employee to get raise: 
                </label>
                <input type="text" name="empl_for_raise" id="empl_raise" /><br />

                <label for="raise_amt"> Raise amount (%): </label>
                <input type="number" name="raise_amount" id="raise_amt" />
            </fieldset>

            <div class="submit">
                <input type="submit" value="Make changes" />
                </div>
        </fieldset>
    </form>
    <?php
    }
?>