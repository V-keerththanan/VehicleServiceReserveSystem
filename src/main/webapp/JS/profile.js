var profile_user_name;
$(document).ready(function() {
	
    const introspectionEndpointUrl = 'https://api.asgardeo.io/t/keerthan/oauth2/introspect';
    const accessToken = localStorage.getItem('access_token');
    const idToken = localStorage.getItem('id_token');

    if (accessToken && idToken) {
        var settings = {
            "url": "https://api.asgardeo.io/t/keerthan/oauth2/userinfo",
            "method": "GET",
            "timeout": 0,
            "headers": {
                "Authorization": "Bearer " + accessToken
            },
        };

        $.ajax(settings)
            .done(function (response) {
                console.log(response);
                var username = response.username;
                var given_name = response.given_name;
                var phone = response.phone_number;
                var email = response.email;
                var lastname = response.family_name;
                var country = response.country;
                var parts = given_name.split(' ');
                var firstName = parts[0];
                $('#givenName').text(given_name + " " + lastname);
                $('#email').text(email);
                $('#phone').text(phone);
               profile_user_name=username;
                

            })
            .fail(function (jqXHR, textStatus, errorThrown) {
                console.error('Error:', errorThrown);
                alert("Error in the authorization. Login again!");
                window.location.href = "../index.jsp";
            });
    } else {
        window.location.href = "../index.jsp";
    }
});
