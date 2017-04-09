<?php
	$name = htmlspecialchars($_Post['name']);
	$email = htmlspecialchars($_Post['email']);
	$subject = htmlspecialchars($_Post['subject']); 
	$message = htmlspecialchars($_Post['message']);
	if ($name == '' || $email == '' || $subject == '' || $message == ''){
		echo 'Umple toate rindurile';
		exit;
	}
	// Trimete
	$subject = "=?utf-8?B?".base64_encode($subject)."?=";
	$headers = "From: $email\r\nReply-to: $email\r\nContent-type: text/html; charset=utf-8\r\n";
	if(mail("test@mail.ru", $subject, $message, $headers))
		echo "Mesaj transmis";
	else
		echo "Mesaj netransmis";
 ?>