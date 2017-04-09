<!DOCTYPE html>
<html>
<head>
	<?php 
	require_once "functions/functions.php";
	$title = "Animal Planet";
	require_once "blocks/head.php";
	$animal = getAnimal (3, $id);
	?>
</head>
<body>
<?php require_once "blocks/header.php"  ?>
<div id="wrapper">
	<div id="leftCol">

	<?php
		for ($i = 0; $i < count($animal); $i++){
			if ($i == 0)
				echo "<div id=\"bigArticle\">";
			else
				echo "<div class=\"article\">";
			echo '<img src="/img/articles/'.$animal[$i]["id"].'.jpg" alt="Articolul '.$animal[$i]["id"].'" title="Articolul '.$animal[$i]["id"].'">
	<h2>'.$animal[$i]["title"].'</h2>
	<p>'.$animal[$i]["intro_text"].'</p>
<a href="/article.php?id='.$animal[$i]["id"].'">
<div class="more">Urmatoarea</div>
</a>
	</div>';
	if ($i == 0)
		echo "<div class=\"clear\"><br></div>";
		}  
	?>
	
</div>
<?php require_once "blocks/rightCol.php" ?>
</div>
<?php require_once "blocks/footer.php" ?>
</body>
</html>