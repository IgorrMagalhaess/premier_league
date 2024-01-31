require "rails_helper"

describe Player, type: :model do
   describe "relationships" do
      xit { should belong_to(:team)}
   end
end