curl -u 'admin:admin' -d '{username:"tsummers777", email:"tsummers999@localhost.com", password:"admin", roles : [ADMIN]}' -X POST http://localhost:32826/rest/user-management/users
curl -u 'admin:admin' -d 'admin' -X PUT http://localhost:32826/rest/user-management/password/tsummers777
