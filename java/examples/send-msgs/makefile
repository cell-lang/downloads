send-msgs.jar: main.cell
	mkdir -p tmp
	rm -rf tmp/net/ tmp/gen/
	mkdir tmp/gen/
	java -jar ../../bin/cellc-java.jar project.txt tmp/gen/
	javac -d tmp/ tmp/gen/*.java
	jar cfe send-msgs.jar net.cell_lang.Generated -C tmp net/
	@echo
	@echo '********************************************************************************'
	@echo '********************************************************************************'
	@echo
	@echo 'To run the program now type:'
	@echo '  java -jar send-msgs.jar init-state.txt msg-list.txt final-state.txt'
	@echo ''
	@echo 'The program will load an initial state for the automaton from'
	@echo 'init-state.txt, a list of messages to send to it from msg-list.txt'
	@echo 'and will save its final state in the file final-state.txt'
	@echo ''

clean:
	@rm -rf tmp/ send-msgs.jar
