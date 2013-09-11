require "i18n_utils"

describe I18nUtils do
  let(:view) { double.extend(I18nUtils::All) }

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

  # Not as integrated as I might like to really trust these tests, but simple.
  # Suggestions for improvement are very welcome.
  describe "t_scope" do
    def link_to(text, url)
      %{<a href="#{url}">#{text}</a>}
    end

    it "captures content and abbreviates scopes" do
      expect(view).to receive(:capture) { |&block| block.call }

      expect(view).to receive(:t).
        with("sign_in_now.text", sign_in: %{<a href="url">Sign in</a>}).
        and_return("output")

      expect(view).to receive(:t).
        with("sign_in_now.sign_in", {}).
        and_return("Sign in")

      view.t_scope("sign_in_now.text") do |scope|
        scope.sign_in do
          link_to(scope.t(:sign_in), "url")
        end
      end
    end
  end
end
