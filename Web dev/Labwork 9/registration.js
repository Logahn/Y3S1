function RegForm(obj) {
  function CheckData() {
    var ans;
    ans = confirm("Вы уверены, что хотите отправить введенные данные ?");
    if (ans) submit();
  }

const name_string = String(obj.name.value);
if(name_string == ''){
    name_test = false;
    alert("Поле фамилии пусто");
}

const phone_string = String(obj.telephone.value);
const phone_regex = new RegExp("^[\+]?[0-9]{1}?[\s\.]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{2}[-\s\.]?[0-9]{2}$");
const phone_match = phone_regex.exec(phone_string);

if (phone_match){
    var phone_test = true;
}
else {
  phone_test = false;
alert("Введите правильный формат телефона");
}


const email_string = String(obj.email.value);
const regex = new RegExp("^[\.\-_A-Za-z0-9]+?@[\.\-A-Za-z0-9]+?\.[A-Za-z0-9]{2,6}$");
const email_match = regex.exec(email_string);

  if (email_match){
      var email_test = true;
  }
  else {
    email_test = false;
  alert("Введите правильный формат электронной почты");
}
if(email_test == true && phone_test == true && name_test == true){
    CheckData();
}

}