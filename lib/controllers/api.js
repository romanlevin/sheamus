'use strict';

var mongoose = require('mongoose'),
    Thing = mongoose.model('Thing');

/**
 * Get awesome things
 */
exports.awesomeThings = {
  list: function(req, res) {
    return Thing.find(function (err, things) {
      if (!err) {
        return res.json(things);
      } else {
        return res.send(err);
      }
    });
  },
  show: function(req, res) {
    var thingId = req.params.id;

    Thing.findById(thingId, function(err, thing) {
      if (!err) {
        if (thing) {
          res.send(thing);
        } else {
          res.send(404, 'THING_NOT_FOUND')
        }
      } else {
        res.send(err)
      }
    });
  },
  create: function(req, res) {
    var newThing = new Thing(req.body);
    newThing.save(function(err) {
      if (err) {
        return res.json(400, err);
      }
      return res.json(thing);
    });
  },
  remove: function(req, res) {

  }
};
