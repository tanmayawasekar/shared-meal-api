const express = require('express');
const https = require("https");
const assert = require('assert');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const compression = require('compression');
const helmet = require('helmet');
const path = require('path');

var app = express();

const clientUrl = (process.env.CLIENT_URL || '*');

app.set('port', (process.env.PORT || 8080));
// Below 2 statements need to be removed
app.set('views', path.join(__dirname, '/src/views'));

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", clientUrl);
  res.header("Access-Control-Allow-Headers", "Origin, Authorization, X-Requested-With, Content-Type, Accept");
  res.header("Access-Control-Allow-Methods", "POST, GET, OPTIONS, HEAD,PUT,DELETE");
  if ('OPTIONS' === req.method) {
    res.sendStatus(200);
  } else {
    next();
  }
});

//App activity logging
app.use(morgan(':method :url :date :remote-addr :status :response-time'));
//Parses requests
app.use(bodyParser.json());

app.use(bodyParser.urlencoded({ 'extended': true }));

//Using the compression middleware
app.use(compression());

// error handler
app.use(function(err, req, res, next) {
	res.status(err.status || 500).send(err.message || 'Internal Server Error');
});

//Security Middleware
app.use(helmet());

//Best practices app settings
app.set('title', 'Shared-Meal');
app.set('query parser', `extended`);

app.listen(app.get('port'), () => {
  console.log(`Find the server at: http://localhost:${app.get('port')}/`); // eslint-disable-line no-console
});
