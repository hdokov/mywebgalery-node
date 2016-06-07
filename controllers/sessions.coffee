module.exports =
  index: (req, res, next) ->
    pageParams =
      title: "#{global.mainTitle} - Welcome"
      pageTitle: 'Welcome'
      user: req.app.locals.user
      time: new Date()
      layout: 'admin/layout_admin'

    res.render 'admin/index', pageParams

  new: (req, res, next) ->
    pageParams =
      title: "#{global.mainTitle} - Log In"
      pageTitle: 'Welcome back'
      user: req.app.locals.user
      layout: 'admin/layout_admin'
    res.render 'admin/login', pageParams

  create: (req, res, next) ->
    if req.body.email == 'q' && req.body.password == 'q'
      req.session.user =
        name: 'q'
        registered: true

      res.redirect '/admin'
    else
      pageParams =
        title: "#{global.mainTitle} - Log In"
        pageTitle: 'Welcome back'
        user: req.app.locals.user
        layout: 'admin/layout_admin'
        error: 'Invalid username or password'

      res.render 'admin/login', pageParams

  delete: (req, res, next) ->
    console.log 'logout'
    req.session.reset()
    req.app.locals.user = null
    res.redirect '/admin/login'
