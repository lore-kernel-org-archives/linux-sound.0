From: Zwane Mwaikambo <zwane@linux.realnet.co.sz>
Date: Sun, 27 Jan 2002 06:36:57 +0000
Subject: Re: Driver for Philips Acoustic Edge (PSC 706)
Message-Id: <marc-linux-sound-101211367527239@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-101207524703621@msgid-missing>
In-Reply-To: <marc-linux-sound-101207524703621@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat, 26 Jan 2002, Richard V Robinson wrote:

> Hi.  Can anyone tell me if there exists a linux driver for the Philips 
> Acoustic Edge (PSC 706) sound card?  Or if someone is working on one?

Could you please supply a lspci of the sound card.

> If not, I'm a fairly resourceful and clever programmer.  And I have the 
> card in question.  How does one get started creating drivers for 
> hardware like this?

You can start of by finding out the chip on the sound card and getting the 
datasheets for it. If the chip supports or is supported by some current 
drivers, you could make the appropriate additions to the supported cards 
in the particular modules (add Vendor/PCI IDs) and see if it works. 
Otherwise you could start work on a new driver :) It might be an idea to 
read through a couple of drivers and see how they do things. For 
additional help regarding kernel hacking in general, check out 
www.kernelnewbies.org and the mailling list is at 
kernelnewbies@nl.linux.org

Good luck, and happy hacking :)

Regards,
	Zwane Mwaikambo


