def env_for_instagram
  # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
  request.env['devise.mapping'] = Devise.mappings[:user]
  request.env['omniauth.auth'] =
  {
    'provider' => 'instagram',
    'uid' => 'aosdja3wr3',
    'info' => {
      'nickname' => '234234234aaa',
      'email' => 'manoel@marques.com',
      'name' => 'Manoel Marques',
      'first_name' => 'Manoel',
      'last_name' => 'SilvaMarques',
      'image' => 'http://graph.facebook.com/234234234/picture?type=square',
      'urls' => {
         'Facebook' => 'https://www.facebook.com/manoelsilva'
      },
      'verified' => true
    },
    'credentials' => {
      'token' => 'CAAB0tua806QBADFj0UfNZCeMBlwgkiD0NDT2wl0BX8OUsIxn6xYDBMPZArVSMbBBvY1V7ijrA2OaLhf3bafod2EFUJXHBww2Y0wvrIVomUDZCqPupkyzoKmyAww3IfZCU87C9ArbWQcDwYBstjbBLcimO3yjqWIFzoHi1uCHj4HzAqvDLqyL6ZBC3sRFpvEwZD',
      'expires_at' => 1389367549,
      'expires' => true
    },
    'extra' => {
      'raw_info' => {
         'id' => '234234234',
         'name' => 'Manoel Marques',
         'first_name' => 'Manoel',
         'last_name' => 'Marques',
         'link' => 'https://www.facebook.com/234234234',
         'username' => '234234234aaa',
         'gender' => 'male',
         'email' => 'manoel@marques.com',
         'timezone' => 0,
         'locale' => 'pt_PT',
         'verified' => true,
         'updated_time' => '2013-10-18T14:15:28+0000'
      }
    }
  }
end