require "i18n_utils"

class FakeModel; end

describe I18nUtils do
  include I18nUtils::Helper

  describe "t_attribute" do
    it "uses human_attribute_name" do
      klass = double
      allow(klass).to receive(:human_attribute_name).with(:foo).and_return("foux du fafa")
      t_attribute(klass, :foo).should == "foux du fafa"
      I18nUtils.t_attribute(klass, :foo).should == "foux du fafa"
    end
  end

  describe "t_model" do
    before do
      FakeModel.stub_chain(:model_name, :human).and_return("Clase")
    end

    context "given a class" do
      it "uses model_name.human" do
        t_model(FakeModel).should == "Clase"
        I18nUtils.t_model(FakeModel).should == "Clase"
      end
    end

    context "given an instance" do
      it "looks it up on the class" do
        t_model(FakeModel.new).should == "Clase"
        I18nUtils.t_model(FakeModel.new).should == "Clase"
      end
    end
  end

  # Not as integrated as I might like to really trust these tests, but simple.
  # Suggestions for improvement are very welcome.
  describe "t_scope" do
    def link_to(text, url)
      %{<a href="#{url}">#{text}</a>}
    end

    it "captures content and abbreviates scopes" do
      expect(self).to receive(:capture) { |&block| block.call }

      expect(self).to receive(:t).
        with("sign_in_now.text", { sign_in: %{<a href="url">Sign in</a>}}).
        and_return("output")

      expect(self).to receive(:t).
        with("sign_in_now.sign_in", {}).
        and_return("Sign in")

      t_scope("sign_in_now.text") do |scope|
        scope.sign_in do
          link_to(scope.t(:sign_in), "url")
        end
      end
    end
  end
end
