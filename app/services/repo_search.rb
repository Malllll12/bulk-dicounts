class RepoSearch

  def repo_name
      Repo.new(service.repo).name
  end

  def contributor_info
    contributor_hash = Hash.new
    service.contributors.map do |data|
        contributor = Contributor.new(data)
        contributor_hash[contributor.login] = contributor.contributions
      end
      contributor_hash
  end


  def service
    GithubService.new
  end

end
