FactoryBot.define do
	factory(:project) do
		title { Faker::Company.bs }
    payment_date { Date.current + 1.month }
	end
end