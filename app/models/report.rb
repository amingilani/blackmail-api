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

class Report < ApplicationRecord
  belongs_to :organization

  validates :issue_date, presence: true
  validate :issue_date_cannot_be_in_the_future

  # The setter for the issue date rounds the date up to the end of
  # a year's half
  # It also raises an error if the issue_date is in the future
  # @param Date issue_date
  # @return Date
  def issue_date=(issue_date)
    issue_date = Date.parse(issue_date) unless issue_date.is_a? Date
    year = issue_date.year
    month = issue_date.month
    updated_date = month <= 6 ? Date.new(year, 6, 30) : Date.new(year, 12, 31)
    self[:issue_date] = updated_date
  end

  private

  def issue_date_cannot_be_in_the_future
    errors.add(:issue_date, "can't be in the future") if issue_date && issue_date.future?
  end
end
