class AuthDirective extends Nodulator.Directive 'auth', '$window', '$http', 'userService'

  state: 'login'
  ident:
    username: 'test'
    password: 'test'

  Auth: ->
    @$http.post('/api/1/clients/login', @ident)
      .success =>
        @$window.location.href = '/'
      .error (data) =>
        @error = data
        setTimeout =>
          @$apply =>
            @error = ''
        , 10000

  Signup: ->
    @$http.post('/api/1/clients', @ident)
      .success =>
        @Auth()
      .error (data) =>
        @error = data
        setTimeout =>
          @$apply =>
            @error = ''
        , 10000

  Toggle: ->
    if @state is 'login'
      @state = 'signup'
    else if @state is 'signup'
      @state = 'login'

AuthDirective.Init()
