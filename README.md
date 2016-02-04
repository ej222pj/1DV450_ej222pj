# 1DV450_ej222pj
Repo för hela kursen 1DV450

För att starta applikationen i C9   
rails s -b $IP -p $PORT 


Starta upp registrerings applikationen genom att göra såhär:

1. Clona eller ladda ner en zip av projektet
2. Öppna en lämplig terminal som har git, till exempel git shell
3. Navigera till mappen registrationApp i projekt mappen via terminalfönstret
4. Därefter starta upp lämpligt Virtual Machine program, t.ex. Oracle VirtualBox
5. Skriv 'vagrant up' i terminal fönstret där du har navigerat till registrationApp mappen
6. När den är färdig med eventuella installationer, skriv 'vagrant ssh'
7. Du är nu inloggad i den virtuella maskinen. Skriv 'cd /vagrant' och sedan 'cd /registrationApp'
8. Nu bör du vara i projekt mappen på den virtuella maskinen. Skriv 'bundle install'
9. Därefter skrivar man 'rake db:setup' för att skapa databaserna och köra seed filen. Sen skall allt vara klart att köra
10. Skriv 'rails s -b 0.0.0.0' i terminalfönstret och servern på den virtuella maskinen startar
11. Prova applikationen i webläsaren på localhost:3000
12. Väl inne på registreringssidan kan man logga in genom följande användare:

*Username: admin
*Password: 123456

*Username: Eric
*Password: 123456
