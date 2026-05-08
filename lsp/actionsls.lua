local function get_github_token()
  local handle = io.popen("gh auth token 2>/dev/null")
  if not handle then
    return nil
  end
  local token = handle:read("*a"):gsub("%s+", "")
  handle:close()
  return token ~= "" and token or nil
end

local function parse_github_remote(url)
  if not url or url == "" then
    return nil
  end

  local owner, repo = url:match("git@github%.com:([^/]+)/([^/%.]+)")

  -- SSH format
  if owner and repo then
    return owner, repo:gsub("%.git$", "")
  end

  -- HTTPS format
  owner, repo = url:match("github%.com/([^/]+)/([^/%.]+)")
  if owner and repo then
    return owner, repo:gsub("%.git$", "")
  end
  return nil
end

local function get_repo_info(owner, repo)
  local cmd =
    string.format("gh repo view %s/%s --json id,owner --template '{{.id}}\t{{.owner.type}}' 2>/dev/null", owner, repo)

  local handle = io.popen(cmd)
  if not handle then
    return nil
  end

  local result = handle:read("*a"):gsub("%s+$", "")

  handle:close()

  local id, owner_type = result:match("^(%d+)\t(.+)$")
  if id then
    return {
      id = tonumber(id),
      organizationOwned = owner_type == "organization",
    }
  end
  return nil
end
