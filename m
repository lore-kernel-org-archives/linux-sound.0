From: Jaroslav Kysela <perex@suse.cz>
Date: Sun, 21 Nov 1999 22:10:28 +0000
Subject: Re: AC97 codec on asus k7m?
Message-Id: <marc-linux-sound-94322222809463@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94322145708503@msgid-missing>
In-Reply-To: <marc-linux-sound-94322145708503@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 21 Nov 1999 buddy@dookie.net wrote:

> Is there any support for the 'AC97' codec on the Asus K7M athlon
> motherboard?

AC97 codec is not directly accessible. You should get specs for the chip
which is doing a bridge between codec and system bus.

							Jaroslav

> 
> I can't get it going, not even with OSS commercial...
> 
> Any suggestions are appreciated.
> 
> lspci shows that it is some kind of VIA chipset...
> 
> foobar:~$ /sbin/lspci
> 
> 00:00.0 Host bridge: Advanced Micro Devices: Unknown device 7006 (rev 23)
> 00:01.0 PCI bridge: Advanced Micro Devices: Unknown device 7007 (rev 01)
> 00:04.0 ISA bridge: VIA Technologies, Inc.: Unknown device 0686 (rev 1b)
> 00:04.1 IDE interface: VIA Technologies, Inc. VT82C586 IDE [Apollo] (rev
> 06)
> 00:04.4 Class 0c05: VIA Technologies, Inc.: Unknown device 3057 (rev 20)
> 00:04.5 Multimedia audio controller: VIA Technologies, Inc.: Unknown
> device 3058 (rev 21)
> 00:0d.0 VGA compatible controller: Nvidia Corporation Riva TNT (rev 04)
> 00:0e.0 Ethernet controller: Digital Equipment Corporation DECchip 21140
> [FasterNet] (rev 22)
> 
> 
> Thanks for any help
> 
> --buddy smith
> 

-----
Jaroslav Kysela <perex@suse.cz>
SuSE Linux    http://www.suse.com
ALSA project  http://www.alsa-project.org
