From: Benno Senoner <sbenno@em.gardena.net>
Date: Mon, 22 Nov 1999 13:50:21 +0000
Subject: Re: AC97 codec on asus k7m?
Message-Id: <marc-linux-sound-94327882018416@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94322145708503@msgid-missing>
In-Reply-To: <marc-linux-sound-94322145708503@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> 
> Dan Hollis (goemon@sasami.anime.net) said: 
> > On Sun, 21 Nov 1999 buddy@dookie.net wrote:
> > > 00:04.5 Multimedia audio controller: VIA Technologies, Inc.: Unknown device 3058 (rev 21)
> > 
> > MVP4 Audio Codec
> 
> ... which may supported by the VIA 82cxxx driver, in the later 2.2.x kernels.
> 
> Bill
> 
Does anyone know about the status of the AC97 codec found in
Intel i810 chipset based mainboards like the supermicro 370SWD ones ?

X11 is supported by the Precision Insight drivers,
now what's missing is sound, since I want to use these boxes as
thin multimedia clients.

I remember that Alan Cox said on linux-kernel that enough
specs are available to write a driver, but I'm not aware of a
working driver. ( 4Front seems to support the i810 sound
in their commercial OSS) 

regards,
Benno.
