<?php
	 // Connection parameters
	$host = 'cspp53001.cs.uchicago.edu';
	$username = 'yiqin';
	$password = 'aitiejah';
	$database = $username.'DB';
	// Attempting to connect
	$dbcon = mysqli_connect($host, $username, $password, $database)
	 or die('Could not connect: ' . mysqli_connect_error());
	print 'Connected successfully!';

 
	$testObject = ParseObject::create("TestObject");
	$testObject->set("foo", "bar");
	$testObject->save();
?>