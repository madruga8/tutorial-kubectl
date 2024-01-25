<?php

// Consume CPU
for($i = 0; $i < 1000000; $i++) {
    $a = rand(0, 1000);
    $b = rand(0, 1000);
    $c = $a / ($b + 1);
}

echo '<H1>SERVIDOR: ' . gethostname() . "</H1>"; 

?>
