From: OHPC <ohpc@mii.zaz.com.br>
Date: Fri, 07 Jan 2000 10:58:32 +0000
Subject: Re: drivers for SB PCI512 ?
Message-Id: <marc-linux-sound-94724307513195@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94718546400262@msgid-missing>
In-Reply-To: <marc-linux-sound-94718546400262@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Me again...
I went out and bought the Creative SB PCI512 last night, which seemed like
a safe bet since I saw the PCIxxx cards listed on ALSA'a page yesterday
when I was browsing.
However, after looking at that page again today, I see that the PCI512 is
"capable of being supported but no driver has been written yet".
CRAP!
It uses the same chipset as the SB Live!, so maybe those drivers will
work. Anybody got a PCI512 working under Linux? OSS's website makes no
mention of the card at all. Probably b/c it's too new. *Shrug*
Any help would be much appreciated.
peace,
-Paco


Yes, the SB Live drivers will work - I have one, and it worked. You need to 
download and compile the drivers from the creative page. I talked to them, 
and even them will say they don't know if it will work...
But I managed to put mine to work.

Get the drivers from http://www.opensource.creative.com.

Modify your conf.modules like this:

alias sound emu10k1
options emu10k1 joystick=0x200

Then:
"make depend"
"make clean"
"make"
"make install".

Run:
"depmod -a"
"insmod soundcore"
"modprobe emu10k1".

More details? Go to this site:
http://www.euronet.nl/~mailme/index3.html
