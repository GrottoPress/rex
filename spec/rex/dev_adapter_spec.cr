require "../spec_helper"

describe Rex::DevAdapter do
  it "translates text" do
    Rex.temp_config(adapter: Rex::DevAdapter.new) do
      Rex.t(:named, {name: "Kwame"}).should(eq "named")
      Rex.t("unnamed", "Ama").should(eq "unnamed")
      Rex.t(:plain).should eq("plain")
    end
  end

  it "localizes value" do
    Rex.temp_config(adapter: Rex::DevAdapter.new) do
      Rex.l(25, :custom).should(eq "25")
    end
  end
end
