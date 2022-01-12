class GithubService

  def repo
    get_url("little-esty-shop")
  end

  def contributors
    get_url("little-esty-shop/contributors")
    # api.find_all do |user|
    #   if user[:login] == "hannahkwarren"
    #     users[user[:login]] = user[:contributions]
    #   elsif user[:login] == "Malllll12"
    #     users[user[:login]] = user[:contributions]
    #   elsif user[:login] == "dkulback"
    #     users[user[:login]] = user[:contributions]
    #   elsif user[:login] == "Eldridge-Turambi"
    #     users[user[:login]] = user[:contributions]
    #   end
    # end
    # users
  end

  def pull_requets
    get_url("little-esty-shop/pulls?state=closed")
  end

  def get_url(url)
    response = HTTParty.get "https://api.github.com/repos/hannahkwarren/#{url}"
    pared = JSON.parse(response.body, symbolize_names: true)
  end
end
