From: Heikki Kallasjoki <fizban@fiiu.org>
Date: Thu, 18 Nov 1999 22:38:36 +0000
Subject: Re: AWE64
Message-Id: <marc-linux-sound-94296480217757@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91965172830159@msgid-missing>
In-Reply-To: <marc-linux-sound-91965172830159@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On 18.11.99, at 17:06, Dave Mielke wrote with subject 'Re: AWE64':
> >i'm using Red Hat Linux 6.0
> >and i can't install sound blaster awe64 here
> >when i run kernel configuration everything
> >appears to be ok. the option creative sb awe32/64
> >is checked but it doesn't work.
> >
> >does anybody know how to solve this problem ?

> Have you run the RedHat tool "sndconfig" yet? It'll put all the right stuff
> into "/etc/conf.modules", which you'll need or your sound card will not work.
> If you've done that already, then let me know and I'll help you check out your
> kernel configuration. Attaching a copy of your ".config" file to your next
> reply would be helpful.

Here's not a solution to the situation where the card would not work at
all, but to a common problem that the audio playing features work fine but
the wavetable-driver refuses to find the card. The beginning of the next
chapter doesn't sound like it would belong there, but that's just because
I wrote it first and then this 'introduction', or something.

Another possible problem with sbAWE64, that many people seem to have, is
the fact that pnpdump fails to recognize correctly those IO-ports for the
wavetable part of the card. I have never used Red Hat personally, so I
don't know much about how configuring it goes, but when you get the card
working so that sound can be heard, if you then notice that the wavetable
driver doesn't find the card, and it is a PnP version, (is there a
non-PnP-awe64?) the cause might be this.

Usually isapnp's configuration file is /etc/isapnp.conf, and when created
with pnpdump like it's usually done, there's lines like:
--clip--
(CONFIGURE CTL00e4/297738542 (LD 2
#     ANSI string -->WaveTable<--
#..comments..
(IO 0 (BASE 0x0620))
--clap--

Now, AWE64 uses also ports 0xA20 and 0xE20 in addition to 0x620, and all
implementations of pnpdump I've seen have been unable to detect that. So,
one should replace the line
(IO 0 (BASE 0x0620))
with something like
--clip--
(IO 0 (BASE 0x0620))
(IO 1 (BASE 0x0A20))
(IO 2 (BASE 0x0E20))
--clap--
in /etc/isapnp.conf.

This isn't a reason why the card would not work at all, but this is often
a reason for the wavetable-synth to not function. As I said, I haven't
seen Red Hat much, so I don't know if they had fixed this problem
somehow. Anyway, I thought that this should once again be mentioned here,
because so many people keep asking about it.

 --fiz.
-------------------
"Darkness brushes its steelcold wings
and wipes the raintears off our shadows
Flies through our minds and leaves a burning black track
And we cling to whats in the gloom, empty and shallow"
      ------------------
