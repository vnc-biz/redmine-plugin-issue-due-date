# The plugin should transparently set the Issue due date whenever an Issue is saved to be:
#
#     * Issue due date or
#     * Version due date or
#     * Deliverable due date
#
# The plugin should also hook into the Version class and have it mass update all issues assigned to the Version when the Version is saved. Issues will be changed when they:
#
#     * Do not have a due date or
#     * Have a due date equal to the Version's old date
#
# Example:
# Version X due on 2008-01-01 with Issues A (due on 2008-01-01), Issue B (2008-02-01), and Issue C (no due date). Changing Version X's date to 2008-01-15 will update the due date of Issue A and Issue C to 2008-01-15. Issue B's due date will stay 2008-02-01.
#
# When reassigning a version, if the issue due date matched the old version date, the issue should change it's due date to match the new version.
#
# Example: if i move an issue from version A to version B and the date matches the version A, then the date should change to version B.
#
# The same behavior will be for Deliverables, if the Deliverables plugin is installed.

require 'redmine'

# TODO: Change this to use the name of your plugin
RAILS_DEFAULT_LOGGER.info 'Starting Issue Due Date plugin for RedMine'

# TODO: Change the name 
Redmine::Plugin.register :issue_due_date do
  name 'Issue Due Date plugin'
  author 'Eric Davis <edavis@littlestreamsoftware.com> of Little Stream Software'
  description 'Plugin to set the issue due_date based on Version and / or Deliverable due dates'
  version '0.1.0'
end

require_dependency 'issue_due_date_patch'
Issue.send(:include, IssueDueDatePatch)

require_dependency 'version_due_date_patch'
Version.send(:include, VersionDueDatePatch)

if Object.const_defined?("Deliverable")
  require_dependency 'deliverable_due_patch'
  Deliverable.send(:include, DeliverableDuePatch)
end
