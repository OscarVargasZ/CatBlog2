FactoryBot.define do
    factory :request do
        type_request {'user'}
        user
        article
        comment
    end
end