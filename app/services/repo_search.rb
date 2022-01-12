class RepoSearch

  def repo
    Repo.new(service.repo, service.pull_requets)
  end

  def contributor_info
    contributor_hash = Hash.new
    service.contributors.map do |data|
        contributor = Contributor.new(data)
        contributor_hash[contributor.login] = contributor.contributions
      end
      contributor_hash
  end

  # def user_pr
  #   service.user_pr.map do |data|
  #
  #   end
  # end

  def service
    GithubService.new
  end

end
