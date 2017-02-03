.PHONY=all,quality,test

all: quality test

test: test-py

test-py:
	nosetests video_xblock --with-coverage --cover-package=video_xblock

quality: quality-py quality-js

quality-py:
	pylint -f colorized video_xblock
	pep8 . --format=pylint --max-line-length=120

quality-js:
	eslint video_xblock/static/js/

deps:
	pip install -r requirements.txt
	bower install

package:
	echo "Here be static dependencies packaging"