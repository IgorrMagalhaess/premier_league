require "rails_helper"

describe Team, type: :model do
   describe "relationships" do
      it { should have_many(:players)}
   end
end