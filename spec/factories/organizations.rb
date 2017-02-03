# frozen_string_literal: true
# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  full_name  :string           not null
#  uniq_name  :string           not null
#  domain     :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
# Indexes
#
#  index_organizations_on_slug       (slug) UNIQUE
#  index_organizations_on_uniq_name  (uniq_name)
#  index_organizations_on_user_id    (user_id)
#

# frozen_string_literal: true
FactoryGirl.define do
  factory :organization do
    full_name { Faker::Company.name }
    domain { Faker::Internet.domain_name }
    uniq_name { Faker::Internet.user_name }
  end
end
