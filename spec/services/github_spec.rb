require 'rails_helper'

RSpec.describe GithubService do
  let(:github_api) {GithubService.new}
  it 'pases the api' do
    actual = github_api.repo_name
    expected = "little-esty-shop"
    expect(actual).to eq(expected)
  end
  describe '#user_names_and_commits' do
    it 'returns the github usernames for the repo' do
      actual = github_api.user_names_and_commits
      expected = {"Eldridge-Turambi" => 35,
                  "Malllll12" => 52,
                  "dkulback" => 51,
                  "hannahkwarren" => 70}
      expect(actual).to eq(expected)
    end
  end

  # describe '#user_commits' do
  #   it 'returns github commits for each user' do
  #     actual = github_api.user_commits
  #     expected = "Eldridge-Turambi Malllll12 dkulback hannahkwarren"
  #     expect(actual).to eq(expected)
  #   end
  # end
end
