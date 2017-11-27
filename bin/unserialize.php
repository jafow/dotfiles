<?php

$usage = "php unserialize.php <filename> <destination>\n";

if($argc < 2){
    echo $usage;
    die;
}

if($argc < 3) {
    echo $usage;
    die;
}
$string_unserialized = unserialize(file_get_contents($argv[1]));

$json = json_encode($string_unserialized , JSON_PRETTY_PRINT|JSON_UNESCAPED_UNICODE);

file_put_contents($argv[2] , $json);
