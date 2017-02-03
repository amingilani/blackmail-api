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
class Organization < ApplicationRecord
  belongs_to :user, required: true
  has_many :reports

  include FriendlyId
  friendly_id :uniq_name, use: :slugged

  validates :uniq_name, presence: true
  validates :domain, presence: true
  validates :full_name, presence: true
end
