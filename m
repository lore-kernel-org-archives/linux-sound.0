From: Jonathan Masters <mastersj@periscope-systems.freeserve.co.uk>
Date: Wed, 11 Aug 1999 19:53:13 +0000
Subject: [Fwd: hdd & sound]
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------1C7E2ED430416937048681A3"
Message-Id: <marc-linux-sound-93441086507280@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------1C7E2ED430416937048681A3
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit



--
Jonathan C. Masters                     (jonathan@oxlug.org)
                                        PGP: www.brookes.ac.uk/~95227860/KEY

           "Upon this rock I will build my church,
            and the gates of hell shall not prevail against it".

                 -- Matthew 16, 17-18



--------------1C7E2ED430416937048681A3
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

X-Mozilla-Status2: 00000000
Message-ID: <37B1D45B.768FDD6A@periscope-systems.freeserve.co.uk>
Date: Wed, 11 Aug 1999 20:51:55 +0100
From: Jonathan Masters <mastersj@periscope-systems.freeserve.co.uk>
X-Mailer: Mozilla 4.61 [en] (X11; U; Linux 2.2.10 i686)
X-Accept-Language: en
MIME-Version: 1.0
To: Mike Ricketts <rickettm@ox.compsoc.net>
Subject: Re: hdd & sound
References: <Pine.LNX.4.10.9908112011350.1973-100000@oakley.keble.ox.ac.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Has Mr Gates been at the kernel source? (well you did say "evil"). Seriously
though, it's scheduler related. Someone please fix this as writing a cd now makes
my 2.2.10 system *UNUSEABLE* since I must have sound to work. Music keeps me
happy. Besides, when this happens, the processor load is all of 4% or so - hardly
enough to cause problems - since it happens on PCI hardware too - it aint my ISA
soundcard (SB 64 AWE Gold) - interestingly, it haoppens when ripping cd's too -
but cdrecord causes less than cdparanoia (my hdds are on one controller, the
cd-writer/cdrom are on the other.). I've already posted my machine specs but more
is available in someone wants. Howz about Alan/Linus comments on this so we know
once and for all? Thanx.

Mike wrote:

> On Sat, 7 Aug 1999, Wakko Warner wrote:
>
> > I'm noticing this one one of my machines.  When writing to a hard drive, the
> > sound drags.  The machine I'm on has piix4 ide and an isa scsi card.  I'm
> > playing sounds from the drive on the scsi card (aha1510 I think is the scsi
> > card).  I tried writing to both an ide and scsi drive, both drag the sound.
> > Sound card is an SB16 pnp /w ide port (not disablable unfortunately).  I had
> > a similar problem on an isa ide card playing sounds off of the hard drive
> > (like 44k 16bit 2ch sound off the drive, sound card was an ess card).  My
> > home box that this is happneing on is 2.2.7.  The one with the isa ide is no
> > longer active, but it was running 2.0.36.
> >
> I see much the same thing under (extremely) heavy disk load, both on
> onboard piix4 ide, and on an onboard aic7??? scsi.
>
> Things it isn't:
>   hardware - too many people are seeing the same thing for that
>   driver specific - it happens on both ide and scsi, and with both sb and
>                     ess cards
>   anything blindingly obvious
>
> Currently I suspect something evil either in sound_core.c or sound_timer.c
> or (more likely) something scheduler related, but this is wild guessing.  Any
> ideas?
>
> --
> Mike <rickettm@ox.compsoc.net>
>
> Q:      What's yellow, and equivalent to the Axiom of Choice?
> A:      Zorn's Lemon.

--
Jonathan C. Masters                     (jonathan@oxlug.org)
                                        PGP: www.brookes.ac.uk/~95227860/KEY

           "Upon this rock I will build my church,
            and the gates of hell shall not prevail against it".

                 -- Matthew 16, 17-18




--------------1C7E2ED430416937048681A3--
