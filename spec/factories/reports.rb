# frozen_string_literal: true
# == Schema Information
#
# Table name: reports
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  issue_date      :date             not null
#  letters         :boolean          default("false"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_reports_on_organization_id  (organization_id)
#

FactoryGirl.define do
  factory :report do
    issue_date  { Faker::Date.between(10.years.ago, 1.year.ago) }
    letters     { Faker::Boolean.boolean }
  end
end
