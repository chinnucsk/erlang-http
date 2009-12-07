APP=http
ERL=ERL
ERLC=ERLC

all: compile

compile:
	@$(ERL) -make

clean:
	-@rm -f ebin/*.beam

docs:
	@$(ERL) -noshell -run edoc_run application '$(APP)' '"."' '[]'

clean-docs:
	-@rm -f doc/edoc-info doc/*.html doc/*.css doc/*.png

run:
	@$(ERL) -pa ebin -run http

test: compile
	@$(ERL) -pa ebin -eval "eunit:test({application,http})" \
	-noshell -s init stop
