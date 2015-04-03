<?php
function mac2int($mac) {
    return base_convert($mac, 16, 10);
}
 
function int2mac($int) {
    return base_convert($int, 10, 16);
}

?>
