From: Ben Chu <benchu@connect.ab.ca>
Date: Wed, 06 Jan 1999 23:42:19 +0000
Subject: Re: Turtle Beach Montego PCI sound card
Message-Id: <marc-linux-sound-91573624409498@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91561747117474@msgid-missing>
In-Reply-To: <marc-linux-sound-91561747117474@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Matthew Haas wrote:

> Greetings Linux-sound!
>
>         A friend of mine recently switched to Linux, and amazed at its
> power and abilities, wishes to move as many functions over to Linux as
> possible. Many of his devices had support and were supported, and others,
> such as his USB scanner, etc. will have better support under Linux
> 2.2...however, one big thing is sound, of which he has a Turtle Beach
> Montego... having perused through the kernel sound source, various
> outdated howtos and Linux sound web pages, we were unable to determine if
> any support (commercial or standard kernel) was available for this card.
> Any sound would be sufficient for starters, even simple Sound Blaster PRO
>  (if this card has a native emulation mode). Does anyone know of any
> support for this card? This is the Montego, not the new Montego II.
>
>         Thanks in advance.

The SoundBlaster emulation of the Montego is horrible, thus it does not work
under Linux as a soundblaster card.  The one place I've seen to _promise_ to
support the Montego is http://www.opensound.com/ and even they seem to be
aiming for a Q2 release of the driver.  Until then, your friend is probably
out of luck.

Ben
