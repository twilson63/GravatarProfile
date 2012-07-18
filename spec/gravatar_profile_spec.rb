require File.dirname(__FILE__) + '/../gravatar_profile'

describe GravatarProfile do
  context 'Happy Food' do
  subject { GravatarProfile.new('tom@jackhq.com') }
  it 'should be true' do
    subject.should be_true
  end

  it 'should get displayName' do
    subject.name.should == 'tjackhq'
  end

  it 'should get photo' do
    subject.photo.should == 'http://0.gravatar.com/avatar/ebd63577f6cef101bf22245572781d5d'
  end

  it 'should get profile url' do
    subject.url.should == 'http://gravatar.com/tjackhq'
  end
  end
  context 'Bad Food' do
    subject { GravatarProfile.new('foo@foo.com') }
    it 'should handle bad food' do
      subject.name.should == 'Unknown'
      subject.photo.should == ''
      subject.url.should == ''
    end
  end
end
