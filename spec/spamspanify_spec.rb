require "spec_helper"

describe Spamspanify do

  describe "replaces an email address in a string with SpamSpan markup" do
    let(:s){ "Email b.flat@minor.com please." }

    it "of paranoia level 1" do
      expect(s.spamspanify(1)).to eq "Email <span class='spamspan'><span class='u'>b.flat</span>@<span class='d'>minor.com</span></span> please."
    end

    it "of paranoia level 3" do
      expect(s.spamspanify(3)).to eq "Email <span class='spamspan'><span class='u'>b [dot] flat</span> [at] <span class='d'>minor [dot] com</span></span> please."
    end
  end

  it "does not include a dot as the last character of an address" do
    s = "Email major.seven@a-flat.com."
    expect(s.spamspanify).to eq "Email <span class='spamspan'><span class="\
      "'u'>major.seven</span>@<span class='d'>a-flat.com</span></span>."
  end

  it "allows an ampersand in the local part of an email address" do
    s = "Email major&minor.seven@a-flat.com."
    expect(s.spamspanify).to eq "Email <span class='spamspan'><span class="\
      "'u'>major&minor.seven</span>@<span class='d'>a-flat.com</span></span>."
  end

  describe "should transform html <a href='mailto:..> links as well" do
    it "when link text is email address" do
      s = "Email <a href='mailto:b.flat@minor.com'>b.flat@minor.com</a> please."
      expect(s.spamspanify(1)).to eq "Email <span class='spamspan'><span class='u'>b.flat</span>@<span class='d'>minor.com</span></span> please."
    end

    it "using the link text as link text again" do
      s = "Email <a href='mailto:b.flat@minor.com'>B.Flat</a> please."
      expect(s.spamspanify(1)).to eq "Email <span class='spamspan'><span class='u'>b.flat</span>@<span class='d'>minor.com</span>(<span class='t'>B.Flat</span>)</span> please."
    end
  end
end
