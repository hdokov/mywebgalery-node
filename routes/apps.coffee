express = require('express')
router = express.Router()
hbs = require('hbs')
apps = require('../controllers/apps')

hbs.registerPartials("#{__dirname}/../views/apps/partials/")
checkLogin = (req, res, next) ->
  if req.app.locals.user
    next()
  else
    res.redirect('/admin/login')

router.all '*', checkLogin
router.get '/', apps.index
router.post '/', apps.create
router.put '/:id', apps.update
router.get '/:id', apps.show

module.exports = router
