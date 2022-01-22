// (function(){

$(document).ready(function(){
  $('#signin').click(signIn);
});



function signIn(){
    let login = $('#contact-1-name').val();
    let password = $('#contact-1-password').val();
    var returns;
    let loginApi = Fetch('http://localhost:8080/api/login/', {'login':login,'password':password});
    loginApi.then((data)=>{
      if(data.status == '204'){
        $('#menu').append('<li><a href="">Аккаунт</a></li>');
      }
    });
    
    
}



async function Fetch(url = '', data = {}) {
    // Default options are marked with *

  
  var formBody = [];
  for (var property in data) {
    var encodedKey = encodeURIComponent(property);
    var encodedValue = encodeURIComponent(data[property]);
    formBody.push(encodedKey + "=" + encodedValue);
  }
  formBody = formBody.join("&");
    let response = await fetch(url, {
      method: 'POST',
      // mode:'no-cors',
      headers: {
        // 'Content-Type': 'application/json'
        'Content-Type': 'application/x-www-form-urlencoded',
      },

      body: formBody // body data type must match "Content-Type" header
    });
    return  await response.json();
 }
      
