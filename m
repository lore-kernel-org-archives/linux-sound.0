From: Ishaaq Chandy <kuru@lw1.vsnl.net.in>
Date: Sun, 04 Oct 1998 15:50:45 +0000
Subject: Re: How do I use isapnp?
Message-Id: <marc-linux-sound-90751757632230@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90742331706312@msgid-missing>
In-Reply-To: <marc-linux-sound-90742331706312@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Mike wrote:
> 
> I have this card running in that I can play and record, but not at the
> same time :)
> 
> I had some problems with pnpdump on an alpha with the 1.13 version of
> isapnptools.  It would find the card, but the resulting file would fail
> when I used
> 
> ./isapnp isapnp.conf
> 
> You may or may not have this problem if you are using an intel based
> machine, I do not know, but if you do, I recommend the newer version, it
> works correctly.

 I am using an intel based system, a Pentium 200MMX. Your setup works
fine. Thanks a ton for the trouble taken. However it only works so far
as isapnp recognising the soundcard. I still get "sb: dsp reset failed"
messages! The only way I have been able to avoid this is by using
Dos->Loadlin->Linux (a highly distasteful method I admit!)

I failed to mention that pnpprobe can't seem to find the card, what I
don't understand is the fact that I have to go through all this headache
even though my BIOS is PnP aware and must have already found the card.

Thanks again for the trouble, I personaly feel that no matter what
Linux's other great qualities are, one of its best is the ever-helpful
Linux community.

Ishaaq Chandy
