App.Views.Main = {}
App.Views.Main.Users = {}
App.Views.Main.Pages = {}
App.Views.Main.Articles = {}

App.Views.User = {}
App.Views.User.Articles = {}

App.Views.Admin = {}
App.Views.Admin.Users = {}
App.Views.Admin.Articles = {}
App.Views.Admin.Comments = {}

App.Views.Layouts = {}
App.Views.Shared = {}

loco = new App.Loco
  turbolinks: 2                               # false by default
  notifications:
    enable: true                              # false by default
    pollingTime: 3000                         # 3000 ms by default
    log: true                                 # false by default
    ssl: false                                # your current protocol by default
    location: 'notification-center'           # 'notification-center' by default
    size: 10                                  # 100 by default
    allowedDisconnectionTime: 10              # 10 by default [sec]
  locale: 'en'                                # 'en' by default
  #protocolWithHost: 'http://localhost:3000'  # if provided - loco will be using absolute path
                                              # instead of site-root-relative in all xhr requests
  postInit: ->
    return if $('body').data('rails-env') isnt 'test'
    App.Env.loco.getWire().setPollingTime 1000

loco.init()