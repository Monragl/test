// (function(){
    $('#signin').click(signIn);




    function signIn(){
        let login = $('#login').text()
        let password = $('#password').text()

        console.log(JSON.stringify(Fetch('http://192.168.102.115/api/login/', {'login':login,'password':password})));
    }



    async function Fetch(url = '', data = {}) {
        // Default options are marked with *
        const response = await fetch(url, {
          method: 'POST',
          mode: 'no-cors', // no-cors, *cors, same-origin
        //   cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        //   credentials: 'same-origin', // include, *same-origin, omit
          headers: {
            'Content-Type': 'application/json'
            // 'Content-Type': 'application/x-www-form-urlencoded',
          },
        //   redirect: 'follow', // manual, *follow, error
        //   referrerPolicy: 'no-referrer', // no-referrer, *client
          body: JSON.stringify(data) // body data type must match "Content-Type" header
        });
        return await response.json(); // parses JSON response into native JavaScript objects
      }
      
