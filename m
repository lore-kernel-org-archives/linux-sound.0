From: Joe Miklojcik <jmik@nbcs.rutgers.edu>
Date: Thu, 28 Oct 1999 18:08:35 +0000
Subject: Re: [linux-audio-dev] Re: 4D-NXs (was Re: Sync Issues)
Message-Id: <marc-linux-sound-94114191816205@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dan Hollis wrote:

> On Wed, 27 Oct 1999, Paul Barton-Davis wrote:
> >       * "we don't have enough programmers to do that"
>
> If the drivers are being written for them by volunteers, I dont see how
> this is relevant.

They just can't imagine anybody who isn't in their shop writing a driver.
It's a really crappy job.

> >       * "we don't have any written documentation to give you guys -
> >          we wrote the driver by having the software group sit in with
> >        the hardware group"
>
> This should be a warning sign to anyone thinking of purchasing their
> hardware. If a company cant be bothered to internally document the
> hardware, what happens if key engineers leave the company? Oh dear, their
> project is *permanently screwed*, which means zero support for end users.
> This is no way to run a company.

I agree.  A couple of years ago, I badgered Opcode into giving me specs for
their 8Port/SE under NDA so I could write a Linux driver for myself.  It
took three passes just to convince them that I could do it if I had the
specs, even if I didn't work in their shop.  It took two more passes to
convince them that I would honor the NDA as I would any other legal
obligation, and that I would furnish any results I gained working with
NDA protected material back to them.  Never mind Open Source, these guys
didn't want me to know their deep dark "how to use a parallel
port" secrets.  Turns out the real reason it was pulling teeth to get their
spec is that the spec revealed how shoddy of an engineering job the 8Port/SE
was.  I wound up destroying the spec and giving the unit to a Windows
sufferer.

>
> >       * "we think our hardware's proprietary secrets will be revealed
> >          if there is a source code driver"
>
> Uh, isnt this what patents are for? If someone reverse engineers their
> card, they are *completely screwed* unless they have patent protection.

Shhh :)  They haven't figured that out yet.  It's the only thing saving us
on a lot of the hardware Linux supports.  I'm not a lawyer, but I think that
they can deny the right to reverse engineer in a user license, which would
make some drivers illegal.  This leads to the silly phrase

"If drivers are outlawed, only outlaws will have drivers."

--
Joe Miklojcik - NBCS System Programmer - http://oss.rutgers.edu
The purpose of computing is insight, not numbers. --Richard W. Hamming, 1962
