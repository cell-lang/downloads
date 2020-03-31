send-msgs.jar: main.java logins.cell
	rm -rf tmp/
	mkdir tmp/
	mkdir tmp/gen/ tmp/cls/
	java -jar ../../bin/cellc-java.jar -g project.txt tmp/gen/
	javac -d tmp/cls/ main.java tmp/gen/*.java
	jar cfe send-msgs.jar Main -C tmp/cls/ .
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
	@echo 'It will also print each message sent to the automaton, whether it was'
	@echo 'processed successfully, and the state of the automaton before and after'
	@echo 'each message.'
	@echo ''

clean:
	rm -rf tmp/ send-msgs.jar
