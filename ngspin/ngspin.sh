# Angular, spins up a new project 

ngspin(){
    echo "Choose an app name."
    read appName
    mkdir $appName && cd $appName

    mkdir server
    echo "Choose a port number for $appName."
    read port
    
    sed -e "s/\${port}/$port/"\
        -e "s/\${appName}/$appName/"\
        ~/.zsh_functions/ngspin/templates/_server.js >> ~/$appName/server/server.js

    mkdir app && cd app
    sed "s/\${appName}/$appName/"\
        ~/.zsh_functions/ngspin/templates/_index.html >> ~/$appName/app/index.html

    mkdir mainApp controllers routes views services directives css
    touch mainApp/mainApp.js
    touch controllers/controllers.js
    touch routes/routes.js
    touch views/home.html
    touch services/services.js
    touch directives/directives.js
    touch css/main.css
    cd ..
    sublime ../$appName
    typeset -u cappName
    cappName=$appName
    message="A new Angular app - $cappName -  has been created "
    spCount=`echo $message | wc -m`
    stars="\n"`seq  -f "*" -s '' $spCount`"\n"
    echo $stars $message $stars
    nodemon server/server.js
}
