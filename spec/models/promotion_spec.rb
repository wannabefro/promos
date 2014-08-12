require 'rails_helper'

describe Promotion do
  it { should belong_to(:user) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }

end
