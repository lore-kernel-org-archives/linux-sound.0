From: Tuukka Toivonen <tuukkat@ees2.oulu.fi>
Date: Mon, 07 Dec 1998 21:56:34 +0000
Subject: Re: GUS MAX problem
Message-Id: <marc-linux-sound-91310222118392@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91295518418565@msgid-missing>
In-Reply-To: <marc-linux-sound-91295518418565@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 7 Dec 1998, Benoit Rouits wrote:

>"Perex's driver" because i can't do anything with the standard one.And this 
>old one do not manage really aGUS MAX (ie: 16 bit recording and 32 
>polyphonic voices) but a standard GUS thatis a 8-bit sample card. So, now i 

The standard Linux sound driver (also called as OSS/Lite or just OSS, Open
Sound System) should support GUS MAX too with all 32 voices and 16-bit
recording.

Why I like more Perex Ultra drivers? Because it allows full-duplex sound
between different programs (start one program which plays digitized sound
and then you can start another program which can record digital audio).

It also has UltraMIDI, which can play MIDIs and nice Tcl/Tk GUI mixer.

Both drivers should support GUS MAX and not only classic GUS.

>will be able to use TRUELY my GUS MAX.I also got the irq 11 for it but i 
>added
> irq 5 for the midi

Hmm. I can't check right now but I think that you can not even tell the
driver what secondary IRQ to use. I think that the second IRQ is mainly
meant for SB emulation and has no use in Linux.

When you set up OSS (using make config/menuconfig/xconfig) you should
not select "General MIDI" or whatever the option was called... it
would allow you to select another IRQ, but this option is not meant
to be used with GUS.

(However, OSS worked althought I ignorantly selected the General
MIDI and second IRQ at first).

>features and DMA 1 for output and DMA 3 four input 
>audio.

You should use DMAs higher than 3. DMA 1 and 3 are only 8-bit wide, while
higher DMAs are 16-bit and should work at least little faster.

--
| Tuukka Toivonen <tuukkat@ee.oulu.fi>       [PGP public key
| Homepage: http://www.ee.oulu.fi/~tuukkat/       available]
| Try also finger -l tuukkat@ee.oulu.fi
| Studying information engineering at the University of Oulu
+-----------------------------------------------------------
