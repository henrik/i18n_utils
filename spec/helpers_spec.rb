require "i18n_utils"

describe I18nUtils::Helpers do
  let(:view) { double.extend(described_class) }

  describe "t_attribute" do
    it "uses human_attribute_name" do
      klass = double
      allow(klass).to receive(:human_attribute_name).with(:foo).and_return("foux du fafa")
      view.t_attribute(klass, :foo).should == "foux du fafa"
      I18nUtils.t_attribute(klass, :foo).should == "foux du fafa"
    end
  end

  describe "t_model" do
    it "uses model_name.human" do
      klass = double
      klass.stub_chain(:model_name, :human).and_return("Clase")
      view.t_model(klass).should == "Clase"
      I18nUtils.t_model(klass).should == "Clase"
    end
  end
end
