<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="body.css" rel="stylesheet">
    <title>Result</title>
</head>

<body class="body">
    <?php
    $val[] = $_POST["one"];
    $val[] = $_POST["two"];
    $val[] = $_POST["three"];
    $val[] = $_POST["four"];
    $val[] = $_POST["five"];
    $val[] = $_POST["six"];
    $val[] = $_POST["seven"];
    $val[] = $_POST["eight"];
    $val[] = $_POST["nine"];
    $val[] = $_POST["ten"];
    $pent_arr = array();
    $var_length = count($var);
    $sum = 0;

    for ($i = 0; $i < 10; $i++) {

        if ((int)$val[$i] % 5 == 0) {
            array_push($pent_arr, $val[$i]);
        }
    }

    $length = count($pent_arr);
    for ($i = 0; $i < $length; $i++) {
        $sum += $pent_arr[$i];
    }
    echo "Вещественные числа: ";
    foreach ($val as $val) {
        echo ($val . ", ");
    }

    echo "<br><br>Кратно 5: ";
    foreach ($pent_arr as $pent_arr) {
        echo ($pent_arr . ", ");
    }

    echo ("<br><br><b>Сумма, кратная 5: " . $sum . "</b><br><br>");



    ?>

</body>

</html>