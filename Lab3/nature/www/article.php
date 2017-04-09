<!DOCTYPE html>
<html>
<head>
	<?php
	require_once "functions/functions.php";
	$animal = getAnimal (1, $_GET["id"]); 
	$title = $animal["title"];
	require_once "blocks/head.php";
	?>
</head>
<body>
<?php require_once "blocks/header.php"  ?>
<div id="wrapper">
	<div id="leftCol">

	<?php
		echo '<div id="bigArticle">
		<img src="/img/articles/'.$animal["id"].'.jpg" alt="Articolul '.$animal["id"].'" title="Articolul '.$animal["id"].'">
	<h2>'.$animal["title"].'</h2>
	<p>'.$animal["full_text"].'</p>

	</div>';
	?>	
</div>
<?php require_once "blocks/rightCol.php" ?>
</div>
<?php require_once "blocks/footer.php" ?>
</body>
</html>