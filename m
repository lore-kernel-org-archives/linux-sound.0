From: Tony Nugent <Tony.Nugent@usq.edu.au>
Date: Sun, 25 Oct 1998 05:57:09 +0000
Subject: Re: Question:ESS Sound Card
Message-Id: <marc-linux-sound-90938936816466@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90925336113724@msgid-missing>
In-Reply-To: <marc-linux-sound-90925336113724@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat Oct 24 1998 12:10, Stuart Felenstein wrote:

> I have a sound card, manufacturer Shark.  I don't really have much specs
> on it, well I know it's 16bit.
> The driver is ESS1681.  I'm wondering what kind of problems I'll
> encounter and if it's at all possible to even get this card working.

In my experiences with the 18xx series, the ESS chips are a cheap and nasty
SBPro clone.  (No flames please... this is just IMHO).

The only reason I used one for so long was the ability to run an old
Panasonic 2x drive off it on the /dev/sbpcd device.

> I'll probably try the OSS (4 Front) drivers since they seem the most
> stable , at least from what I've read.
> 
> Anyone ever tried this type of card? Any suggestions?  Any help?

The OSS (commercial/time-limited trial) drivers detected the ESS chip I
had, and loaded a specific driver for it.  But I never did get the full
(unlimited) driver for it, since the SB driver in the kernel seemed to work
just as well with it (and the kernels were changing versions quite a bit at
the time... a real hassle to upgrade the OSS drivers all the time).

I'm not so familiar with the 1681 chip (err, not at all actually), so your
milage may vary.  (I'll never touch them again, btw).

Cheers
Tony
