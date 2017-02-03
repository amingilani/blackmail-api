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

require 'rails_helper'

RSpec.describe Report, type: :model do
  let(:new_user) { FactoryGirl.build :user }
  let(:new_organization) { FactoryGirl.build :organization }
  let(:new_report) { FactoryGirl.build :report }

  before :each do
    user = new_user
    org = new_organization
    user.save
    user.organizations << org
    @report = new_report
    @report.organization = org
    @report.save
  end

  it 'has a valid factory' do
    expect(@report.persisted?).to be true
  end

  it 'rounds the issue date upto the next half year' do
    date = Time.zone.today
    year = date.year - 1
    month = (rand * 6).floor
    day = date.day
    @report.issue_date = Date.new(year, month, day) # last year 1st half
    expect(@report.issue_date.month).to eq(6)

    @report.issue_date = Date.new(year, month + 6, day) # last year 2nd half
    expect(@report.issue_date.month).to eq(12)
  end

  it 'rejects dates in the future' do
    date = Time.zone.today
    year = date.year - 1
    month = (rand * 6).floor
    day = date.day
    @report.issue_date = Date.new(year + 10, month, day) # some day in the future
    expect(@report.valid?).to be false
    expect(@report.errors.keys).to include :issue_date
  end
end
