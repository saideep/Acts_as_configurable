# desc "Explaining what the task does"
# task :acts_as_configurable do
#   # Task goes here
# end


desc 'Sets up configurations plugin '
    task :setup do
      
        files_to_be_copied = [
        {:source => "/vendor/plugins/acts_as_configurable/generators/templates/create_configurations.rb", :target => "/db/migrate/#{migration_timestamp}_acts_as_configurable.rb" },
        ]
      
      root = "#{Rails.root}"
      FileUtils.mkdir_p("#{root}/db/migrate") unless File.exists?("#{root}/db/migrate")
      files_to_be_copied.each {|ftbc|
        FileUtils.cp_r(root+ftbc[:source], root+ftbc[:target]) #:force => true)
        puts "Created : #{ftbc[:target]}"
      }
      
      puts "Running \"rake db:migrate\" for you..."
      Rake::Task["db:migrate"].invoke
      
      welcome_screen
     
    end
 
    def migration_timestamp
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    end  
    
    def welcome_screen
    
    mesg = <<HERE
Congratulations for setting the plugin! There are few things to remember here...

Enjoy!
HERE

    puts mesg      
    end
    

