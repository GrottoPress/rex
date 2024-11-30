require "../spec_helper"

describe Rex::DevAdapter do
  before_each do
    Rex.settings.adapter = Rex::DevAdapter.new
  end

  after_all do
    Rex.settings.adapter = SomeAdapter.new
  end

  it "translates text" do
    Rex.t(:named, {name: "Kwame"}).should(eq "named")
    Rex.t("unnamed", "Ama").should(eq "unnamed")
    Rex.t(:plain).should eq("plain")
  end

  it "localizes value" do
    Rex.l(25, :custom).should(eq "25")
  end
end
