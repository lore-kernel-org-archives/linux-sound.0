From: Benno Senoner <sbenno@gardena.net>
Date: Thu, 13 Jul 2000 22:54:41 +0000
Subject: Re: Midi / SysEx - Dump / Linux?
Message-Id: <marc-linux-sound-96352888008012@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96349816311777@msgid-missing>
In-Reply-To: <marc-linux-sound-96349816311777@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 14 Jul 2000, Steve Netting wrote:
> Hi,
> 
>  Can anyone tell me if a utility for Linux exists which allows me
>  to receive midi bulk-dumps (AKA Sys-Ex messages) from external 
>  equipment, and then restore these later (ie, squirt them back
>  out of via midi).
> 
>  Several progs exist for DOS - but I really don't want all the 
>  hassle of dual-booting a machine purely for this ...
> 
>
I am not sure if it works but you could try to do the following:

cat /dev/midi00 >dumpfile

start the sysex transfer

when finished
press CTRL-C
the dumpfile will contain the dumped data.

then to playback the data
first start sysex receive on your midi module
then do
cat dumpfile >/dev/midi00

which should send back the data to the midi port.

I tried here a cat /dev/midi00 >file

and pressed and released two keys on the MIDI keyboard,
then pressed Ctrl-C
and looked at the binary contents of the files:
it contained exactly the two note-on and the two note-off messages
and had a length of 12 byte.

I have currently no external MIDI expanders here so I can't try
to do the dump.

Benno.
