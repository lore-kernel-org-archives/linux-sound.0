From: Etienne Grossmann <etienne@isr.isr.ist.utl.pt>
Date: Mon, 07 Jun 1999 20:04:06 +0000
Subject: Re:  real-time software synths
Message-Id: <marc-linux-sound-92878635814031@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92870053311911@msgid-missing>
In-Reply-To: <marc-linux-sound-92870053311911@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

  Hello,

  this is a bit of a hack, but I patched playmidi-2.3 so that when
it receives a SIGUSR signal, it starts playing a file (whose name
is specified on the command line). 

  So a "client" program can write the file, send a signal, and the 
file will get played. 

  If this can be of any help for you, just ask for the patch. I use it
for a little musical game in perl.


  Cheers,


  Etienne
