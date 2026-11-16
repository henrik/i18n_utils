# frozen_string_literal: true

require "action_view"
require "i18n_utils"

class FakeModel; end

RSpec.describe I18nUtils do
  include I18nUtils::Helper

  describe "t_attribute" do
    it "uses human_attribute_name" do
      klass = double
      allow(klass).to receive(:human_attribute_name).with(:foo).and_return("foux du fafa")
      expect(t_attribute(klass, :foo)).to eq "foux du fafa"
      expect(I18nUtils.t_attribute(klass, :foo)).to eq "foux du fafa"
    end
  end

  describe "t_model" do
    before do
      allow(FakeModel).to receive_message_chain(:model_name, :human).and_return("Clase")
    end

    context "given a class" do
      it "uses model_name.human" do
        expect(t_model(FakeModel)).to eq "Clase"
        expect(I18nUtils.t_model(FakeModel)).to eq  "Clase"
      end
    end

    context "given an instance" do
      it "looks it up on the class" do
        expect(t_model(FakeModel.new)).to eq "Clase"
        expect(I18nUtils.t_model(FakeModel.new)).to eq "Clase"
      end
    end
  end

  describe "t_scope" do
    around do |example|
      I18n.backend.store_translations(:en, sign_in_now: { text: "Please %{sign_in} now.", sign_in: "sign in" })
      I18n.with_locale(:en) { example.run }
    ensure
      I18n.reload!
    end

    it "captures content and abbreviates scopes" do
      view = ActionView::Base.empty
      view.extend(I18nUtils::Helper)

      html = view.t_scope("sign_in_now.text") { |scope|
        scope.sign_in { view.link_to(scope.t(:sign_in), "/login") }
      }

      expect(html).to eq %{Please <a href="/login">sign in</a> now.}
      expect(html).to be_html_safe
    end
  end
end
