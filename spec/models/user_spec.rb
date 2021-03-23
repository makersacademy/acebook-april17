require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(name: "Lizardo", email: "lizard@example.com")
  end

  subject { @user }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }  

  it { is_expected.to be_valid }

  describe "when name field is not present" do

    before { @user.name = "" }
    it { is_expected.not_to be_valid }
    
  end

end
