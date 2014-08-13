require 'rails_helper'

describe Promotion do
  it { should belong_to(:user) }

  it { should have_many(:codes) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }

  it { should ensure_length_of(:message).is_at_most(500) }

end
