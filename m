From: Paul Barton-Davis <pbd@Op.Net>
Date: Thu, 28 Oct 1999 12:39:51 +0000
Subject: Re: 4D-NXs (was Re: Sync Issues)
Message-Id: <marc-linux-sound-94111439108601@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94102459902838@msgid-missing>
In-Reply-To: <marc-linux-sound-94102459902838@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>> >Still irrelevant to the *statement being made*, which is "*we* dont have
>> >enough programmers to do that". Why has the number of programmers *they*
>> >have, have anything to do with us volunteers writing a driver for them for
>> >free? *boggle*.
>> they don't *want* volunteers writing drivers for them. period. end of story.
>
>If thats what they wanted, why didnt they just say it. Stating it that way
>is purposely deceitful.

the fault is more likely in my wording of it. i wasn't trying to quote
directly. the company concerned has just been burned by having a 3rd
party write drivers for it. i don't think they were deceitful with me,
i just didn't present a very accurate picture of what they said.

>Well one would have to weigh the effort of reverse engineering it against
>the gains. Is there any point reverse engineering such ancient hardware?
>Compared to eg reverse engineering the emu10k or aureal chips.

what do you think the expected lifetime of any of the current
generation of chips is, given how long every previous equivalent has
lasted ? if we're reverse engineering a chip more than 18mths after
its first use in a PC soundcard, i'd say we might well be wasting our
time, in the long haul.

>FWIW the SAM9407 documentation was pretty inadequate but gerd rausch
>managed to come up with a pretty decent driver anyway.

well, mine works just fine. its just that the non-linear relationships
between the memory locations on the DSP make it more or less useless
to try to use the driver to alter the operation of the downloaded
microprogram unless you're interested in random FX :) instead, you get
the DSP in something close to passthru mode.

--p
