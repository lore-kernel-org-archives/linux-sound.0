From: Brent Williams <Brent.Williams@mci.com>
Date: Thu, 25 Feb 1999 11:17:52 +0000
Subject: Re: Yamaha OPL3-Sax sound card
Message-Id: <marc-linux-sound-91994192705821@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91989263906824@msgid-missing>
In-Reply-To: <marc-linux-sound-91989263906824@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I''m using the same sound chip in my Gateway Laptop and ended up using th OSS
driver from http://www.opensound.com/

Jin Ko wrote:

> AFAIK, Yamaha OPL3sa emulated Windows Sound System(MSS), SoundBlaster Pro
> and MPU401.  You may enable all of'em to get sound works properly.
>
> -jin
>
> On Wed, 24 Feb 1999, Adam Crews wrote:
>
> >
> > On my Tecra 8000, the manual says that it is a OPL3-SAx card, but the
> > sound modules that seems to power it is the MSS module.
> >
> > I havent played with it too much, but I do know that the MSS module does
> > play 16bit sound through the card.
> >
> > -Adam
> >
> > On Wed, 24 Feb 1999, Ramon Nieto wrote:
> >
> >   | Date: Wed, 24 Feb 1999 08:46:29 -0800 (PST)
> >   | From: Ramon Nieto <ramon_nieto@yahoo.com>
> >   | To: linux-sound@vger.rutgers.edu
> >   | Cc: linux-laptop@vger.rutgers.edu
> >   | Subject: Yamaha OPL3-Sax sound card
> >   |
> >   | i have a Yamaha OPL3-SAx sound card on a toshiba satellite 2500cds.
> >   | i instaled linux red hat 5.1 and i know this can't recognize the sound
> >   | card i tried to configure it as a sound blaster but it only play in 8
> >   | bits mode, the sound card support 16 bit mode.
> >   |
> >   | So i compiled the 2.2.0 kernel with all the support for sound card as
> >   | modules. but i can't configure the sound card yet.
> >   |
> >   | anybody knows what to do? what can i write in the conf.modules? how
> >   | can i use the OSS modules?
> >   |
> >   |
> >   | BTW the isapnptools don't recognize the sound card as a PnP card.
> >   |
> >   |
> >   |
> >   |
> >   | _________________________________________________________
> >   | DO YOU YAHOO!?
> >   | Get your free @yahoo.com address at http://mail.yahoo.com
> >   |
> >
>
> -----------------------------------------------------------------
> Jin Ko                                        mailto:jin@nuri.net
> Network Engineer                           http://ghost.nuri.net/
> International Backbone Group                 phone:+82-2-531-7924
> Inet, Inc. -- a PSINet Company in Korea        fax:+82-2-555-8127

--
----------------------------------------------------------
Work in progress, please be gentle...
----------------------------------------------------------

        Brent Williams
        Brent.Williams@mci.com
        PGP Key -- http://www.palenaka.com/pgp/palenaka.asc
