From: Etienne Grossmann <etienne@anonimo.isr.ist.utl.pt>
Date: Mon, 07 Dec 1998 20:02:29 +0000
Subject: opening /dev/sequencer, in perl.
Message-Id: <marc-linux-sound-91309805316908@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org





  Hello, I have been trying to open /dev/sequencer for writing : In C,
I do :

    fd = open("/dev/sequencer", O_WRONLY))

and the filehandle can be manipulated (carefully) to produce sound. In
perl, I have tried :

try1:
		open(FD,">/dev/sequencer") or die "NOPE\n"; 
		print FD "";

try2:
	  use IO::File; 
		$fh = new IO::File "/dev/sequencer", O_WRONLY; 
		print "NOPE\n" unless defined($fh);

try3:
    use Fcntl; 
		sysopen(FD,"/dev/sequencer",O_WRONLY) ; 
		print FD "" ;


  but none of them work. 


  Would anyone have an explanation to my troubles? 


  Etienne


ps : I use perl 5.005, Linux kernel is 2.0.34 (Debian 2.0). Sound card
     is soundblaster compatible.
