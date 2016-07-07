
Layouts are bigger than templates
A layout is a special view template that wraps other views

# check out app/views/layouts/application.html.erb
to see this in action

The layout uses a 'yield' to insert the individual view template for a specific page

In app/assets/stylesheets/application.css ; there is a long comment (go check it out)
"require_tree" line automatically loads all of the stylehseets in the current directory
and includes them in "application.css"
This is known as "asset pipeline"

Are we still logged in?
Sorcery can help!
methods to remember:
current_user        - return the currently logged in user if one exists
logged_in?          - returns true is user is logged in, and false otherwise


Securing the application:

Except: => Protects the actions besides [:these, :methods]
before_filters :require_login, except: [:new, :create]

Only: => Protect ONLY [:these, :methods] from tampering
before_filters :require_login, only: [:destroy]
