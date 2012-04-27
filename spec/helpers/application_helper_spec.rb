require "spec_helper"

describe "full title function" do
  it "should have the page name" do
    full_title('Whizz').should =~ /Whizz/
  end

  it "should have the site name" do
    full_title('Whizz').should =~ /Margherita/
  end

  it "should not have the | sign in page without page title" do
    full_title('').should_not =~ /\|/
  end
end
