var express = require('express');
var app = express();
var path = (__dirname + '/../app').normalize();
var port = ${port};

app.use(express.static(path));
app.listen(port);
console.log("The ${appName} app is listening on port " + port + ".");
