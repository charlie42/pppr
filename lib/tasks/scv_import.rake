 require 'csv'
 namespace :import do
 	desc "Import medicines"
 	task medicines: :environment do
 		Medicine.destroy_all
 		CSV.foreach("rls.csv") do |row|
 			registry_number, registry_start_date, registry_end_date, space, registry_remove_date, 
 			company, space, name, space, international_name, form, stages, code, documents, group = row
 			
 			m = Medicine.create!(registry_number: registry_number, registry_start_date:
 				registry_start_date, registry_end_date: registry_end_date, 
 				registry_remove_date: registry_remove_date, company: company, name: name, international_name:international_name, 
 				form: form, stages: stages, code: code, documents: documents, group: group)
 		end
 	end
 	desc "Import diagnoses"
 	task diagnoses: :environment do
 		CSV.foreach("mkb.csv") do |row|
 			space, group, space, block, code, name = row
 			m = Diagnosis.create!(group: group, block: block, code: code, name: name)
 		end
 	end
 	desc "Import social benefit code"
 	task sb: :environment do
 		CSV.foreach("sb.csv") do |row|
 			code, name = row
 			m = SocialBenefit.create!(code: code, name: name)
 		end
 	end
 end