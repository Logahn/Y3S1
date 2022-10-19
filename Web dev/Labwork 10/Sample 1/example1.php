<html>

<body>
    <?PHP
    $eaten = $_POST['eat'];
    $apples = 5;
    if ($eaten > 5) {
        $s = 'Простите, но имеется только 5 яблок. Вы не можете съесть
' . $eaten . ' яблок!';
    } else {
        $apples -= $eaten;
        $s = 'А теперь имеется только ' . $apples . ' яблок!';
    }
    echo '<b>' . 'Результат: <br>' . $s . '</b>';
    ?>
</body>

</html>