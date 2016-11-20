require './lib/person.rb'
# require './lib/atm.rb'

describe Person do
  subject { described_class.new(name: 'Xerxes', cash: 0, account: nil ) }

  it 'has a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to raise error if no name is set' do
    expect { described_class.new }.to raise_error 'Error: You need a person name!'
  end

  it 'is expected to have a :cash attribute with value of 0 on initialize' do
    expect(subject.cash).to eq 0
  end

  it 'has an :account attribute' do
    expect(subject.account).to be nil
  end

  context 'this person can open an account = create an Account' do
    before { subject.create_account } # create an acct to test on, remember that before {} = before (:each) do..end

      it 'after account creation, this person has an account' do
        expect(subject.account).not_to be nil
      end

      it 'Person account attrib is of Account class' do
        expect(subject.account).to be_an_instance_of Account
      end

      it 'with themselves (him or her) as an owner' do
        expect(subject.account.account_owner).to be subject
      end
  end

  describe 'can manage funds if an account has been created' do
    let(:atm) { Atm.new }
    before { subject.create_account }

    it 'can deposit funds - take from cash in pocket' do
      expect(subject.deposit(100)).to be_truthy
    end

    it 'adds funds to the account balance and deducts it from cash' do
      subject.cash = 100
      subject.deposit(100)
      expect(subject.account.balance).to be 100
      expect(subject.cash).to be 0
    end

    it 'and can withdraw funds' do
      command = lambda { subject.withdraw(amount: 100, pin_code: subject.account.pin_code, account: subject.account, atm: 'ICA') }
      expect(command.call).to be_truthy
    end

    it 'raises an error when withdrawing if no ATM is passed in' do
      command = lambda { subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account) }
      expect { command.call }.to raise_error 'An ATM is required.'
    end

  end

  describe 'cannot manage funds if no account has been created,' do
    it 'doesn\'t allow depositing of funds' do
      expect { subject.deposit(100) }.to raise_error(RuntimeError, 'No account for deposits present.')
    end
  end

end
