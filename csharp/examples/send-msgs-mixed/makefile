send-msgs.dll: main.cs logins.cell
	make -s clean
	mkdir tmp/
	dotnet ../../bin/cellc-cs.dll project.txt tmp/
	cp main.cs send-msgs.csproj tmp/
	dotnet build -c Debug tmp/
	@echo
	@echo '********************************************************************************'
	@echo '********************************************************************************'
	@echo
	@echo 'To run the program type:'
	@echo '  dotnet run --project tmp/ init-state.txt msg-list.txt final-state.txt'
	@echo '  cat final-state.txt'

clean:
	@rm -rf final-state.txt tmp/
