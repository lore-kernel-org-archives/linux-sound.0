From: "Dennis K. Grow" <dkgrow@primenet.com>
Date: Thu, 17 Jun 1999 04:50:30 +0000
Subject: Re: AWE64 ISA - game port
Message-Id: <marc-linux-sound-92959534930453@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92953529008788@msgid-missing>
In-Reply-To: <marc-linux-sound-92953529008788@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Natanael,

    You probably meant /proc/ioports.

Dennis

Natanael Copa wrote:

> hi!
>
> Check in /proc/interrupts if something else is using port 0x200
>
> Nat
>
> "Soulier, Frederic" wrote:
>
> > A "pnpdump >/etc/isapnp.conf" reports:
> >    LD0   audio
> >    LD1   game
> >    LD2   wave table
>
> > Activating the lines LD0, LD1 & LD2 and doing an
> > "isapnp /etc/isapnp.conf" does not work.
> > Is there anything wrong with activating the line for the game
> > port?
> >
> > note: only io=0x200 is given for the game port.

--
---------------------------------------------------------------------
Dennis Grow
dkgrow@primenet.com
http://www.primenet.com/~dkgrow
---------------------------------------------------------------------
