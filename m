From: Jeff Garzik <jgarzik@mandrakesoft.com>
Date: Tue, 28 Mar 2000 16:55:00 +0000
Subject: Re: [RFT/PATCH] Re: Sound problem after suspend.  Kernel
Message-Id: <marc-linux-sound-95426323324069@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95424773409649@msgid-missing>
In-Reply-To: <marc-linux-sound-95424773409649@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Aki M Laukkanen wrote:
> 
> On Mon, 27 Mar 2000, HvR wrote:
> > the gpm killing is really necessary without this the
> > sound module will not unload!!!
> 
> Really? That seems odd.
> 
> > > With kernel version 2.3.99-pre3 sound words until I
> > > suspend my Toshiba
> > > Satellite Pro 445CDX, but after resuming it will
> > > produce no sound.
> > > This problem came in with the sound clean-ups after
> > > version 2.3.49.
> 
> I have a Toshiba Satellite 220CS laptop which has a OPL3-SA1 sound
> chip. However I've never gotten the opl3sa1 driver to recognise it as such
> so I've used the bare ad1848 (MS Sound System) driver instead. Unlike in
> the case above I've never had working sound after suspend.
> 
> This is an experimental patch which fixes the suspend problem for me and
> I'd appreciate if people would test it.
> 
>   ------------------------------------------------------------------------
>                            Name: ad1848-suspend.patch
>    ad1848-suspend.patch    Type: Plain Text (TEXT/PLAIN)
>                        Encoding: BASE64

Nice, looks good to me.

A lot of drivers need to move in this direction... :)  Thanks for
posting the patch.

	Jeff



-- 
Jeff Garzik              | Tact is the ability to tell a man 
Building 1024            | he has an open mind when he has a
MandrakeSoft, Inc.       | hole in his head.  (-random fortune)
