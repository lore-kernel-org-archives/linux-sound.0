From: reine@mbox314.swipnet.se
Date: Tue, 07 Mar 2000 19:24:56 +0000
Subject: Re: Sound Blaster PCI 128 autodetected as Creative Enconiq Audio PC
Message-Id: <marc-linux-sound-95246068311169@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95241437401207@msgid-missing>
In-Reply-To: <marc-linux-sound-95241437401207@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On  6 Mar, Britton wrote:
> 
> This card is listed as one of those that works in Sound-Howto, but without
> and particular instructions what to do to make it work.  I assume it is
> still based on Creative Ensoniq Audio PCI (1370 or 1371) driver?  I have
> tried compiling into the kernel 1371 support, and dmesg tells me the card
> initialization is begun and completed, but /dev/mixer can't be
> opened.  On the card itself, I see:
> 
> MODEL: CT4700
> 
> and a chip with the following:
> 
> Creative
> 5507
> 5507000101
> A A8D0571
> 9906  TAIWAN
> 
> Am I trying the right driver?  If so, does anyone know of any additional
> tricks that might apply to this card in particular?  
> 
> Thanks,
> Britton Kerin
> 
> 
On my new maschiine with Debian/potato/frozen setup
i use the kernel that comes with the distribution.
In my /etc/modules i have the two lines

soundcore
es1371

and it works. 
I also tried the hard way recompiling kernel etc....
I'm not sure of what to learn from it though ;).

 
Reine
http://home.swipnet.se/roses/
