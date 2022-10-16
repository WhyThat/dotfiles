local M = {}

local jiraBrowseUrl = "https://jira.strg.arte/browse/"

local createJiraLink = function(ticketId)
    return jiraBrowseUrl .. ticketId
end

local getBranchName = function(ticketId, branchSuffix)
    return ticketId .. "_" .. branchSuffix
end

local createBranch = function(ticketId)
    vim.ui.select({
        "Yes",
        "No",
    }, { prompt = "Create a branch" }, function(choice)
        if choice == "Yes" then
            local branchSuffix = nil
            vim.ui.input({ prompt = "Branch name: " }, function(input)
                branchSuffix = input
            end)
            local branchName = getBranchName(ticketId, branchSuffix)
            vim.cmd("silent !git co -b " .. branchName)
        end
    end)
end
M._createBranch = createBranch
M.createJiraTask = function()
    local ticketId = nil
    vim.ui.input({ prompt = "TicketId: " }, function(input)
        ticketId = string.upper(input)
    end)

    createBranch(ticketId)

    local task = "* TODO " .. ticketId .. " :jira:\n" .. createJiraLink(ticketId)
    return task
end

return M
