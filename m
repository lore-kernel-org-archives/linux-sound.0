From: "Robert B. Hamilton" <rbh041a@unix.tamu.edu>
Date: Wed, 21 Apr 1999 19:46:20 +0000
Subject: [RFD] Alternative PC speaker drivers?
Message-Id: <marc-linux-sound-92472595425861@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Just wondering: is anyone interested in exploring alternative methods
for the pc speaker driver?

I've one idea, with some rudimentary code, thats been gathering dust for 
a while. It uses the real time clock for timing, along with udelay.  
It also has a (very) rudimentary soundcore interface. The only advantage 
it would have as an alternative to the existing driver is that the only 
kernel code it touches is in rtc.c, and then only to export a couple of 
functions.  If I understand correctly the objections to the current driver, 
this means it *might* have the potential to have an outside chance of getting 
slipped into the cannonical kernel distribution.

Disadvantage: it sucks up cpu cycles like a black hole. One would need
at least a 266 MHz processor, and even then not recommended on a heavily 
loaded machine.  Sound quality is not quite as good as existing driver, 
although I've gotten functional speech using rsynth, and can also tweak 
Maelstrom, eg, to get reasonable sound.

Any comments, discussion, helpful advice, would be much appreciated.
                                                 --Robert
