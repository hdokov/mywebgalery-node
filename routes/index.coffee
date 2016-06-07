express = require('express')
router = express.Router()

# GET home page.
router.get '/', (req, res, next) ->
  pageParams =
    title: "#{global.mainTitle} - Welcome"
    pageTitle: 'Welcome'
    user: {name: 'Guest'}
    time: new Date()

  res.render 'index', pageParams

module.exports = router
