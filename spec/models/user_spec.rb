require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:collaborators) }
  it { should have_many(:wikis) }
end
