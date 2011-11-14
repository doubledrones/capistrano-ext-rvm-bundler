require 'capistrano/ext/rvm'

Capistrano::Configuration.instance.load do

  namespace :rubygems do
    desc "update rubygems in RVM environment"
    task :update do
      run "rvm '#{rvm_ruby_string}' && gem update --system"
    end
  end

  namespace :bundler do
    desc "install bundler gem in RVM environment"
    task :install do
      run "rvm '#{rvm_ruby_string}' && gem install bundler"
    end
  end

  namespace :bundle do
    desc "install bundle in RVM environment"
    task :install do
      run "cd #{latest_release} && rvm '#{rvm_ruby_string}' && bundle install --gemfile #{latest_release}/Gemfile --quiet --without development test"
    end

    desc "reset bundle in RVM environment"
    task :reset do
      run "cd #{current_path} && rvm '#{rvm_ruby_string}' && rm -f Gemfile.lock && rm -rf `rvm gemdir` && gem install bundler && bundle install --gemfile #{current_path}/Gemfile --without development test"
    end
  end

end
