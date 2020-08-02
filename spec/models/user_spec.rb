require 'rails_helper'

RSpec.describe User, type: :model do
    it "名前とふりがなが取得できること" do
      user = User.new(
        name:  "侍",
        name_call: "サムライ"
      )
      expect(user.namename).to eq "侍 サムライ"
    end
end