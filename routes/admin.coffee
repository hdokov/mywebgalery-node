express = require('express')
router = express.Router()
hbs = require('hbs')
sessions = require('../controllers/sessions')

hbs.registerPartials("#{__dirname}/../views/admin/partials/")
checkLogin = (req, res, next) ->
  if req.app.locals.user
    next()
  else
    res.redirect('/admin/login')

console.log sessions

router.get '/', [checkLogin, sessions.index]
router.get '/login', sessions.new
router.post '/login', sessions.create
router.get '/logout', sessions.delete

module.exports = router
