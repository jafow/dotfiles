<?php

$usage = "php serialize.php <filename> <destination>\n";

if($argc < 2){
    echo $usage;
    die;
}

if($argc < 3) {
    echo $usage;
    die;
}

$string_serialized = serialize(json_decode(file_get_contents($argv[1]),1));

file_put_contents($argv[2] , $string_serialized);
