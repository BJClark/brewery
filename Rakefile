
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name     'brewery'
  authors  'BJ Clark'
  email  'bjclark@me.com'
  url  'http://github.com/BJClark/brewery'
  ignore_file  '.gitignore'
}

