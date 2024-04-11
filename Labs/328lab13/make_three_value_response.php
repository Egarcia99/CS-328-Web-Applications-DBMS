<?php
    /*---
        function: make_three_value_response
        purpose: expects nothing, returns nothing,
            and creates a response that responds to the
            submitted form with the user's three entered values

        by: Sharon Tuttle
        last modified: 2023-04-20
    ---*/

    function make_three_value_response()
    {
        ?>
        <h1> quick'n'sleazy response to three_value's form </h1>

        <?php
        // CHECKING the passed values (because application
        //     tier MUST do this, no matter how much
        //     client-side checking is done -- anyone anywhere
        //     can try to LEAD to here...!)

        // trim will strip whitespace from the beginning and
        //     end of a string

        $value1 = trim(htmlspecialchars($_POST['first']));
        $value2 = trim(htmlspecialchars($_POST['second']));
        $value3 = trim(htmlspecialchars($_POST['third']));

        if (($value1 == "") || ($value2 == "") ||
            ($value3 == ""))
        {
            ?>
            <p id="errors"> MUST fill in all textfields before
                submit! (blanks are NOT enough!) </p>
            <form action="<?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>"
                  method="get">
                <input type="submit" value="try again" />
            </form>
            <?php
        }

        else if (! (($value1 === "vanilla") || ($value1 === "chocolate")) )
        {
            ?>
            <p id="errors"> 1st textfield MUST contain vanilla
                or chocolate! </p>
            <form action="<?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>"
                  method="get">
                <input type="submit" value="try again" />
            </form>
            <?php
        }

        else if ((! is_numeric($value2)) || ($value2 < 10) || ($value2 > 20))
        {
            ?>
            <p id="errors"> 2nd textfield MUST contain a
                number in [10, 20]! </p>
            <form action="<?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>"
                  method="get">
                <input type="submit" value="try again" />
            </form>
            <?php
        }

        else
        {
            ?>
            <p> form's contents: </p>

            <!-- remember, we called htmlspecialchars on
                 the entered values above... -->

            <ul>
            <li> first textfield's value: <?= $value1 ?> </li>
            <li> second textfield's number
                 multiplied by 10: <?= $value2 * 10 ?> </li>
            <li> third textfield's value: <?= $value3 ?> </li>
            </ul>

            <form action="<?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>"
                  method="get">
                <input type="submit" value="done" />
            </form>

            <?php
        }
    }
?>