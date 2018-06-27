RSpec.describe Micropost, type: :model do
    before do 
      @micropost = build(:micropost)
    end

    describe 'micropost varidates check' do
        it 'picture varidates' do
          @micropost.picture=""
          expect(@micropost.valid?).to eq(false)
        end
    end


end