<?php
    /*---
        function: make_three_value_form
        purpose: expects nothing, returns nothing,
            and outputs in its response a form allowing a user to enter
            three values

        by: Sharon Tuttle
        last modified: 2023-04-20
    ---*/

    function make_three_value_form()
    {
        ?>
        <h1> More Practice with JavaScript form validation </h1>

        <hr />
        <p> <strong> note: MUCK button requires JavaScript to work! </strong> </p>
        <hr />

        <button id="test"> MUCK with 1st textfield </button>

        <form action="<?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>"
              method="post"
              id="valueForm">
            <fieldset>
                <legend> Enter values for application </legend>
                <label for="value1">
                    Enter vanilla OR chocolate: </label>
                <input type="text" name="first"
                       id="value1" required="required" /> <br />

                <label for="value2">
                    Enter int in [10-20]: </label>
                <input type="number" name="second" class="right"
                       id="value2" value="13"
                       required="required" /> <br />

                <label for="value3">
                    Value 3: </label>
                <input type="text" name="third"
                       id="value3" required="required" /> <br />

                <div class="sub_button">
                    <input type="submit" value="submit values" />
                </div>
            </fieldset>
        </form>
    <?php
    }
?>