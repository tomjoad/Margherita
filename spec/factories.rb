# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :user do
    name "Łukasz Bibrzycki"
    email "lukasz.bibrzycki@gmail.com"
    password "secret"
    password_confirmation "secret"
    last_name "Bibrzycki"
    zip_code "32-600"
    city "oswiecim"
    home_number "58/4"
    street "slowackiego"
    phone "14521345134"
  end
end
