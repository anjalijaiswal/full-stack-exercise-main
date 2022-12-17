FactoryBot.define do
	factory(:applicant) do
		name { Faker::Name.name }
    overview { 'Overview' }
    funding { 500 }
    status { 'initial_review' } 
		association :project
	end
end