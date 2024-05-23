Add in Gemfile :<br>
`gem "html2slim", github: "slim-template/html2slim"`

Run command :<br>
`for file in app/views/devise/**/*.erb; do bundle exec erb2slim $file ${file%erb}slim --trace && rm $file; done`