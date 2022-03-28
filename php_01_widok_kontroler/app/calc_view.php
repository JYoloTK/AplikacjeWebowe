<?php 
;?>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
<head>
<meta charset="utf-8" />
<title>Kalkulator kredytowy</title>
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
</head>
<body>

<div style="width:90%; margin: 2em auto;">
	<a href="<?php print(_APP_ROOT); ?>/app/inna_chroniona.php" class="pure-button">kolejna chroniona strona</a>
	<a href="<?php print(_APP_ROOT); ?>/app/security/logout.php" class="pure-button pure-button-active">Wyloguj</a>
</div>

<div style="width:90%; margin: 2em auto;">
    
<form action="<?php print(_APP_URL);?>/app/calc.php" method="post" class="pure-form pure-form-stacked">
	<label for="id_x">Kwota kredytu: </label>
	<input id="id_x" type="text" name="x" value="<?php if (isset ($x)) print($x); ?>">
	<label for="id_y">PLN </><br //label>

	<label for="id_y">Okres spłaty: </label>
	<input id="id_y" type="text" name="y" value="<?php if (isset ($y)) print($y); ?>">
	<label for="id_y">miesięcy </><br //label>

	<label for="id_z">Oprocentowanie: </label>
	<input id="id_z" type="text" name="z" value="<?php if (isset ($z)) print($z); ?>">
	<label for="id_y">% </><br //label>

	<input type="submit" value="Oblicz" class="pure-button pure-button-primary"/>
</form>	

<?php
//wyświeltenie listy błędów, jeśli istnieją
if (isset($messages)) {
	if (count ( $messages ) > 0) {
		echo '<ol style="margin: 20px; padding: 10px 10px 10px 30px; border-radius: 5px; background-color: #f88; width:300px;">';
		foreach ( $messages as $key => $msg ) {
			echo '<li>'.$msg.'</li>';
		}
		echo '</ol>';
	}
}
?>

<?php if (isset($result)){ ?>
<div style="margin: 20px; padding: 10px; border-radius: 5px; background-color: #fa0; width:300px;">
<?php echo 'Wysokość raty: '.$result. ' PLN'; ?>
</div>
<?php } ?>
</div>
    
</body>
</html>