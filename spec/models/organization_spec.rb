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
require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:new_user) { FactoryGirl.build :user }
  let(:new_organization) { FactoryGirl.build :organization }

  it 'has a valid model' do
    user = new_user
    user.save
    org = new_organization
    org.user = user
    expect(org.save).to be true
  end

  it 'should need a user, uniq_name domain and name to be valid' do
    org = Organization.new
    expect(org.valid?).to be false
    expect(org.errors.keys).to include :uniq_name
    expect(org.errors.keys).to include :domain
    expect(org.errors.keys).to include :full_name
    expect(org.errors.keys).to include :user
  end
end
