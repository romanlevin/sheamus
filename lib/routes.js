'use strict';

var api = require('./controllers/api'),
    index = require('./controllers'),
    users = require('./controllers/users'),
    session = require('./controllers/session');

var middleware = require('./middleware');

/**
 * Application routes
 */
module.exports = function(app) {

  // Server API Routes
  app.get('/api/things', api.things.list);
  app.get('/api/things/:id', api.things.show);
  app.post('/api/things', api.things.create);
  app.del('/api/things/:id', api.things.remove);
  app.put('/api/things/:put', api.things.edit);

  app.post('/api/users', users.create);
  app.put('/api/users', users.changePassword);
  app.get('/api/users/me', users.me);
  app.get('/api/users/:id', users.show);

  app.post('/api/session', session.login);
  app.del('/api/session', session.logout);

  // All other routes to use Angular routing in app/scripts/app.js
  app.get('/partials/*', index.partials);
  app.get('/*', middleware.setUserCookie, index.index);
};
