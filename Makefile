zipfile = matlab-course-files.zip
include = ../matlab-programming
exclude = $(include)/code/* $(include)/debug/*solution*.m $(include)/*.git* $(include)/*

.PHONY : zip
zip: $(zipfile)

$(zipfile):
	zip -r $(zipfile) $(include) -x $(exclude)
