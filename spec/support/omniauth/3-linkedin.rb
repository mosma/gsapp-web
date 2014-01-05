def env_for_linkedin
  request.env['devise.mapping'] = Devise.mappings[:user]
  request.env['omniauth.auth'] =
    {
      'provider' => 'linkedin',
      'uid' => 'GSjmfjDDD',
      'info' => {
        'name' => 'Manoel Silva Marques',
        'email' => 'manoel@marques.com',
        'nickname' => 'Manoel Silva Marques',
        'first_name' => 'Manoel',
        'last_name' => 'Silva Marques',
        'location' => 'Brazil,
        BR',
        'description' => 'Desenvolvedor @ MoSMA',
        'image' =>       'http://m.c.lnkd.licdn.com/mpr/mprx/0_B1FpR_ddd3zt67R38SxCUYj9J3z-1_Rh3j8b7mGtaTRzcrv8v1l2RTYA4DnrLGqb1G_7Qe',
        'phone' => nil,
        'headline' => 'Jardineiro',
        'industry' => 'Computer Software',
        'urls' => {
           'public_profile' =>          'http://www.linkedin.com/in/manoelsilva'
        }
      },
      'credentials' => {
        'token' => '1df9835d-6518-4826-89f5-3de50e772573',
        'secret' => '064a8471-46ac-4071-88ac-2eddbd32b099'
      },
      'extra' => {
        'access_token' => {
           'token' => '1df9835d-6518-4826-89f5-3de50e772573',
           'secret' => '064a8471-46ac-4071-88ac-2eddbd32b099'
        },
        'raw_info' => {
           'emailAddress' => 'manoel@marques.com',
           'firstName' => 'Manoel',
           'headline' => 'Jardineiro',
           'id' => 'GSjmfjDDD',
           'industry' => 'Computer Software',
           'lastName' => 'Silva Marques',
           'location' => {
              'country' => {
                 'code' => 'pt'
              },
              'name' => 'Portugal'
           },
           'gender' => 'male',
           'pictureUrl' =>          'http://m.c.lnkd.licdn.com/mpr/mprx/0_B1FpR_ddd3zt67R38SxCUYj9J3z-1_Rh3j8b7mGtaTRzcrv8v1l2RTYA4DnrLGqb1G_7Qe',
           'publicProfileUrl' =>          'http://www.linkedin.com/in/manoelsilva'
        }
      }
    }
end