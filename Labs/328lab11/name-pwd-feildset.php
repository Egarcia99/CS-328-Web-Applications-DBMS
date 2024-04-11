<form method="post"
              action=" <?= htmlentities($_SERVER['PHP_SELF'],
                                       ENT_QUOTES) ?>">
<fieldset>
    <legend> Enter Oracle username/password: 
        </legend>

    <label for="name_entry"> Username: </label>
    <input type="text" name="username" id="name_entry"
           required="required" /> 

    <label for="pwd_entry"> Password: </label>
    <input type="password" name="password" id="pwd_entry" 
           required="required" />
    <div class="submit">
    <input type="submit" value="Make changes" />
    </div>
</fieldset>
</form>