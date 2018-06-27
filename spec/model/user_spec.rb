RSpec.describe User, type: :model do
    before do 
      @user = build(:user)
    end
  
    describe 'user varidates check' do
      it 'user varidates' do
        @user.email = 'test@example.com'
        @user.password="password"
        expect(@user.valid?).to eq(true)
      end
  
      it 'name.empty' do
        @user.name = ''
        @user.email = 'test@example.com'
        expect(@user.valid?).to eq(false)
      end
  
      it 'email.empty' do
        @user.email = ''
        expect(@user.valid?).to eq(false)
      end
      it 'password.empty' do
        @user.email = 'test@example.com'
        @user.password = ''
        expect(@user.valid?).to eq(false)
      end
      it 'password.length check' do
        @user.email = 'test@example.com'
        @user.password = '12345'
        expect(@user.valid?).to eq(false)
      end
    end
  end