require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:wiki) }
end
