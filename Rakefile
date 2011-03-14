require 'rubygems'
require 'isolate'
Isolate.now! :system => false

$:.unshift(File.dirname(__FILE__) + "/lib")

require 'brewery'

begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end


require 'spec/rake/spectask'
require 'spec/autorun'


Spec::Rake::SpecTask.new do |t|
  t.warning = true
  t.libs << 'lib'
  t.libs << 'spec'
end

task :default => 'spec'
task 'gem:release' => 'spec'

Bones {
  name     'brewery'
  authors  'BJ Clark'
  email  'bjclark@scidept.com'
  url  'http://github.com/BJClark/brewery'
  ignore_file  '.gitignore'
}

