FactoryBot.define do
    factory :user do
        email {'oscar.vargas@mayor.cl'}
        password {'hola'}
        reset_password_token {'reset'}
    end
end