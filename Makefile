
PLUGIN_NAME=issue_due_date
PLUGIN_DIR=$(DESTDIR)/usr/share/redmine/vendor/plugins/$(PLUGIN_NAME)

INSTALL_FILES=\
	COPYRIGHT.txt				\
	CREDITS.txt				\
	GPL.txt					\
	init.rb					\
	lib					\
	rails					\
	Rakefile				\
	README.rdoc				\
	redmine_issue_due_date.gemspec		\
	spec					\
	VERSION

all:

install:
	@rm -Rf $(PLUGIN_DIR)
	@mkdir -p $(PLUGIN_DIR)
	@for i in $(INSTALL_FILES) ; do cp -R --preserve $$i $(PLUGIN_DIR) ; done
