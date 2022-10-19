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
    $min = $val[0];
    $sum = 0;
    $j = false;
    for ($i = 0; $i < 5; $i++) {

        if ((int)$val[$i] < $min) {
            $min = $val[$i];
            $min_index = $i;
        }
    }

    echo ("<b>Минимальное значение: " . $min . "</b><br><br>");
    if ($min_index == 0) {
        echo ("<b>Предшествующее значение: " . $val[$min_index + 4] . "</b><br><br>");
    } else {
        echo ("<b>Предшествующее значение: " . $val[$min_index - 1] . "</b><br><br>");
    }


    ?>

</body>

</html>