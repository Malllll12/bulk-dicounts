require 'rails_helper'

RSpec.describe RepoSearch do
  let(:repo_search) {RepoSearch.new}
  describe '#repo_name' do
    it 'lists repo_name' do
      actual = repo_search.repo_name
      expected = 'little-esty-shop'
      expect(actual).to eq(expected)
    end
  end
  describe '#contributor_info' do
    it 'lists all contributors for the repo and their commits' do
      actual = repo_search.contributor_info
      expected = {"hannahkwarren"=>73, "Malllll12"=>68, "dkulback"=>58, "BrianZanti"=>51, "Eldridge-Turambi"=>38, "timomitchel"=>9, "scottalexandra"=>3, "jamisonordway"=>1}
      expect(actual).to eq(expected)
    end
  end
end
