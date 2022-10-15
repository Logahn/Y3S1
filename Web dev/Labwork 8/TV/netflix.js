function def(obj) {
    var n = Number(obj.variable_n.value);
    var divisors = [];
    var sum = 0;

    for (i=1;i<=n-1;i++){
        if (n%i==0){
            divisors.push(i);
        }
    }
    for (let i = 0; i < divisors.length; i++) {
    sum += divisors[i];
}
    obj.box_divisors.value = divisors;
    obj.box_sum.value = sum;

   
    if(n == 0) {obj.res.value = "Неверный ввод";}
    else if(n == sum){
        obj.res.value = "Совершенное число";
    }
    else{obj.res.value = "Несовершенное число";}

}