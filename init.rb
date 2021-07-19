require 'redmine'

Redmine::Plugin.register :redmine_silencer do
  name 'Redmine Silencer 2'
  author 'Tobias Fischer'
  description 'A Redmine plugin to suppress email notifications (at will) when updating issues. (This is a fork by GitHub users @networkteam, @commandprompt, @tofi86 and @paginagmbh of the original plugin made by @a1exsh!)'
  version '0.5.0'
  url 'https://github.com/networkteam/redmine_silencer'
  author_url 'https://github.com/tofi86'
  requires_redmine :version_or_higher => '2.4.x'

  permission :suppress_mail_notifications, {}

  settings :default => {
    'silencer_default' => false
  }, :partial => 'redmine_silencer_settings'
end

Rails.configuration.to_prepare do
  Journal.send(:include, RedmineSilencer::JournalPatch)
end

require 'redmine_silencer/issue_hooks'
require 'redmine_silencer/view_hooks'
