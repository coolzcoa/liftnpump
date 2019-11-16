namespace :myrailsapp do
	desc "Sending daily notifications"
	task purge_audits: :environment do
    puts "Daily notifications..."
  end
end