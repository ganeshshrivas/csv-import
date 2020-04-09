require 'csv'
namespace :csv_import do
	task :import => :environment do
		csv_text = File.read(Rails.root.join('lib', 'Import_User_Sample_en.csv'))
		csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
		csv.each do |row|
		  puts row.to_hash
		  u = User.new
		  u.email = row['Email']
		  u.first_name = row['First Name']
		  u.last_name = row['Last Name']
		  u.display_name = row['Display Name']
		  u.job_title = row['Job Title']
		  u.save
		  puts "saved"
		end
	end
end