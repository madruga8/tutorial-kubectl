<?php

$hostname = gethostname();
$ip_address = gethostbyname($hostname);
$current_time = date("Y-m-d H:i:s");
$operating_system = PHP_OS;
$os_version = php_uname('r');


echo "<style>* { background-color: black; color: #33ff33; font-family: 'Courier New', monospace; }</style>";

echo "SERVIDOR PHP: " . $hostname . "<br>";
echo "Endereço IP: " . $ip_address . "<br>";
echo "Hora Atual: " . $current_time . "<br>";
echo "Sistema Operacional: " . $operating_system . "<br>";
echo "Versão do SO: " . $os_version . "<br>";

echo "<br>";
echo "Servidor PHP <a href=\"http://127.0.0.1:8000\">http://127.0.0.1:8000</a><br>";
echo "Servidor PYTHON <a href=\"http://127.0.0.1:5000\">http://127.0.0.1:5000</a><br>";
echo "Servidor NODE <a href=\"http://127.0.0.1:3000\">http://127.0.0.1:3000</a><br>";

?>
