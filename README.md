# nvidia-optimus-switch
Tested on Optimus laptop with opensuse Tumbleweed and latest kernel (4.12 also works)
It's a service that helps suse-prime to totally poweroff nvidia card when intel one is active, and add some features like the Switch at logout (like Ubuntu) and default VGA on boot

READ: if you are not using KDE, prime_logout.waiting daemon will not work, to fix it:
      
Edit prime_logout.waiting: change "ksmserver" with a process that you know for sure is stopped when you logout from your DE
Alternative: manually do "sudo systemctl isolate multi-user.target" after switch command (your session will killed)
     
[IT]
Testato su laptop con tecnologia NVIDIA Optimus e opensuse Tumbleweed con l'ultimo kernel (testato anche 4.12)
È un servizio che aggiunge la possibilità a suse-prime di spegnere totalmente la vga nvidia quando è in uso la intel, e aggiunge la possibilità di effettuare lo switch al logout (come su Ubuntu con nvidia-prime) e scegliere la vga di default al boot

Nota: Se non utilizzate KDE, il demone che attende il log-out per effettuare lo switch non funzionerà. Per impostarlo correttamente:
          
Editate il file prime_logout.waiting
Dovete sostituire la voce "ksmserver" con un processo che siete sicuri venga arrestato nel momento in cui voi effettuate il logout dal vostro DE
Alternativa: dare il comando "sudo systemctl isolate multi-user.target" dopo il comando di switch forzando l'uscita dalla sessione
