From: Deirdre Saoirse <deirdre@deirdre.net>
Date: Fri, 22 Oct 1999 01:14:20 +0000
Subject: Re: interrupt conflict with sound and video?
Message-Id: <marc-linux-sound-94056287729796@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94055376721818@msgid-missing>
In-Reply-To: <marc-linux-sound-94055376721818@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 21 Oct 1999, Peter John Cameron wrote:

> Is this why I get no sound? IRQ 7 is free on my Linux system, so how should
> I go about changing the sound card's IRQ from 11 to 7? Would such a change
> affect how sound works in win98? More to the point, would it solve my lack
> of Linux sound?

That's probably why. You don't want it to use IRQ 7 unless you have
disabled the parallel port in the BIOS. That normally runs on IRQ 7.

As for the Win98 question, I have no personal knowledge as I've never been
a Windows user.

It seems to me the larger problem here is a system with so much stuff that
you've run out of IRQs. Might I recommend SCSI instead of two IDE chains?

-- 
_Deirdre   *   http://www.linuxcabal.net   *   http://www.deirdre.net
"Mars has been a tough target" -- Peter G. Neumann, Risks Digest Moderator
"That's because the Martians keep shooting things down." -- Harlan Rosenthal
<Harlan.Rosenthal@Dialogic.com>, retorting in Risks Digest 20.60
