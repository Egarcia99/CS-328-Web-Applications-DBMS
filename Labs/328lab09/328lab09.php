<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<!-- Emilyo Garcia and Victor Diaz
     Lab 09 PHP 
     LMD: 03/24/2023 -->

<head>
    <title> 328 Lab09 PHP </title>
    <meta charset="utf-8" />

    <link href="http://nrs-projects.humboldt.edu/~st10/styles/normalize.css"
          type="text/css" rel="stylesheet" />
</head>

<body>

<?php
    if ($_SERVER["REQUEST_METHOD"] == "GET") 
    {
    ?>



<form method="post"
          action="http://nrs-projects.humboldt.edu/~eg347/328lab09.php">

        <!-- choose exactly one ice cream flavor -->

        <fieldset>
            <legend> Your ice-cream choice for today: </legend>
            <div id="ice_cream_choice">

                <input type="radio" name="ice_cream_flavor" 
                       value="chocolate" id="choc" /> 
                <label for="choc"> Chocolate </label> <br /> 

                <input type="radio" name="ice_cream_flavor"
                       checked="checked" value="vanilla" id="van" /> 
                <label for="van"> Vanilla </label> <br /> 
    
                <input type="radio" name="ice_cream_flavor" 
                       value="strawberry" id="strawb" />
                <label for="strawb"> Strawberry </label> <br />
                
            </div>
        </fieldset>

        <fieldset>
            <legend> More preferences </legend>
            <div id="more_prefs">

                <!-- choose exactly one preferred beverage -->

                <label for="pref_bev"> Choose your preferred meeting beverage: </label>
                <select name="beverage" id="pref_bev">
                    <option value="iced_tea"> Iced Tea </option>
                    <option value="coffee"> Fresh-Brewed Coffee </option>
                    <option value="hot_tea"> Hot Tea </option>          
                    <option value="apple_juice"> Fresh-Pressed Apple Juice </option>
                    <option value="sp_water"> Sparkling Water </option>
                    <option value="energy_drink"> Energy Drink </option>
                </select> <br />

                <!-- enter ideas for upcoming meetings -->

                <label for="meet_ideas"> Enter ideas for upcoming meetings </label>
                <textarea name="ideas" id="meet_ideas"
                          rows="5" cols="25"></textarea>
            </div>
        </fieldset>

        <div id="submit">
            <input type="submit" />
        </div>
    </form>

    <?php
    }
    else
    {
        ?>
        <ul> 
            <li>  This is the Ice Cream Flavor You Chose! <?=htmlspecialchars ($_POST["ice_cream_flavor"]) ?>. </li>
            <li>  This is the Preferred Beverage You Chose! <?=htmlspecialchars ($_POST["beverage"]) ?>. </li>
            <li>  This is the Idea you stated for the next meeting! <?=htmlspecialchars ($_POST["ideas"]) ?>. </li>
    </ul>
<?php
    }
    ?>

    <footer>
    <hr />
    <p>
        Validate by pasting .xhtml copy's URL into<br />
        <a href="https://html5.validator.nu/">
            https://html5.validator.nu/
        </a>
    </p>
    </footer>
</body>
</html>