# README

Create a sample user to test the authentication mechanism using Rails Console.

rails c
rails> User.create(email:'jwt@jwt.com', password:'jwt', password_confirmation:'jwt')

Start the server and check out how JWT authentication works:

rails s

Open another terminal and use cURL to test the API. First, try to authenticate without any email or password:

curl http://localhost:3000/home

The response should be {"errors":["Not Authenticated"]} since we have not provided any credentials.

Now authenticate against the API and receive a JWT which we will use for subsequent requests:

```
curl -X POST -d email="jwt@jwt.com" -d password="jwt" http://localhost:3000/auth_user
```
You’ll receive a successful response along with a JSON Web Token and additional user information. Like so:

```
{"auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.po9twTrX99V7XgAk5mVskkiq8aa0lpYOue62ehubRY4","user":{"id":1,"email":"jwt@jwt.com"}}
```
Use our fresh auth_token in the request to /home. Like so:
```
curl --header "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.po9twTrX99V7XgAk5mVskkiq8aa0lpYOue62ehubRY4" http://localhost:3000/home
```
We should receive a successful login response, like:

{"logged_in":true}


