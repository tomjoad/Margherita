# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :user do
    name "Łukasz Bibrzycki"
    email "lukasz.bibrzycki@gmail.com"
    password "secret"
    password_confirmation "secret"
  end
end
