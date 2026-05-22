class MyWorker
    include Sidekiq::Worker 
    def perform(name)
        puts "hello #{name} is now in background "
    end
end 