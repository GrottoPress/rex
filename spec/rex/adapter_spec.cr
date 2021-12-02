require "../spec_helper"

describe Rex::Adapter do
  describe "#translate" do
    it "translates text" do
      Rex.t(:named, {name: "Kwame"}).should(eq "Hello, Kwame!")
      Rex.t("named", name: "Ama").should(eq "Hello, Ama!")
      Rex.t(:unnamed, "Kwame").should(eq "Hello, Kwame!")
      Rex.t("unnamed", "Ama").should(eq "Hello, Ama!")
      Rex.t(:plain).should eq("Hello, World!")
    end
  end
end
