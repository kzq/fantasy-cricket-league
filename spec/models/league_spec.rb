require 'rails_helper'

RSpec.describe League, type: :model do
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    
    it { should validate_presence_of(:country) }
  end
  
end
