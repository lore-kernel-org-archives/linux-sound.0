From: Paul Barton-Davis <pbd@Op.Net>
Date: Thu, 28 Oct 1999 00:38:58 +0000
Subject: Re: 4D-NXs (was Re: Sync Issues)
Message-Id: <marc-linux-sound-94107113701231@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94102459902838@msgid-missing>
In-Reply-To: <marc-linux-sound-94102459902838@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>Still irrelevant to the *statement being made*, which is "*we* dont have
>enough programmers to do that". Why has the number of programmers *they*
>have, have anything to do with us volunteers writing a driver for them for
>free? *boggle*.

they don't *want* volunteers writing drivers for them. period. end of story.

>No, Yamaha *does* have documentation on the native PCI stuff. They just
>wont release it.

i have been told by one senior level management guy at yamaha and one
senior programming guy from their main japanese plant that there is
*NO* documentation for the DSP Factory.

>Im more concerned about chip vendors than card manufacturers. If we
>convince the chip vendor to release docs then theres really nothing a card
>manufacturer can do to stop us.

i have the "full specs" to the (ancient) YSS225 FX processor from
yamaha. its installed on the Tropez+. the specs are useless because it
has downloaded microcode to set it up, and they only document 5
microcode programs. Yamaha wrote a special one for Turtle Beach, and
neither they nor Yamaha appear have any record of what it used the dsp
memory locations for.

i've used dosemu to decode part of it, and reverse engineered the
windows FX driver too, but the end result is a GUI with 512 buttons
that inc/dec values in a DSP location to let me try to understand what
it does. since many memory locations' function is tightly coupled with
several others, its a pretty hopeless case. i did manage to find where
the global stereo echo delay time was set, but that was all.

you could argue that this means that we don't have the specs, but
Yamaha certainly doesn't see it that way.

--p
