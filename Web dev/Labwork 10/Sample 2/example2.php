<html>

<body>
    <?PHP
    $n = $_POST['n'];
    $i = 0;
    $result = 0;
    echo '<h3>' . 'Результат расчета :' . '</h3><br>';
    while ($i < $n) {
        if ($i % 20 == 0 && $i > 0) echo '<br>';
        $result += ++$i;
        echo "+" . $i;
    }
    echo '=' . $result;
    ?>
</body>

</html>