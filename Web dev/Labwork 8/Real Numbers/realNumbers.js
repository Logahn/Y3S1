function NumLine() {
  var arr = [];
  var pos_arr = [];
  var neg_arr = [];
  var null_arr = [];
  for (var i = 1; i < 11; i++) arr.push(prompt("Введите число " + i + ":"));

  for (var i = 0; i <= arr.length; i++) {
    if (arr[i] > 0) {
      pos_arr.push(arr[i]);
    } else if (arr[i] < 0) {
      neg_arr.push(arr[i]);
    } else if (arr[i] == 0) {
      null_arr.push(arr[i]);
    }
  }

  document.writeln("Числа в массиве: " + arr + "<br>");
  document.writeln("Положительные числа: " + pos_arr + "<br>");
  document.writeln("Отрицательные числа: " + neg_arr + "<br>");
  document.writeln("Нули: " + null_arr + "<br>");

  document.writeln(
    "Количество положительных чисел: " + pos_arr.length + "<br>"
  );
  document.writeln(
    "Количество отрицательных чисел: " + neg_arr.length + "<br>"
  );
  document.writeln("Количество нулей: " + null_arr.length + "<br>");
}
