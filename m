From: Benno Senoner <sbenno@em.gardena.net>
Date: Fri, 14 Jul 2000 16:46:57 +0000
Subject: Re: Midi / SysEx - Dump / Linux?
Message-Id: <marc-linux-sound-96359752812477@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96349816311777@msgid-missing>
In-Reply-To: <marc-linux-sound-96349816311777@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> 
> --- Benno Senoner <sbenno@gardena.net> wrote :
> [snip]
> > I am not sure if it works but you could try to do
> > the following:
> > 
> > cat /dev/midi00 >dumpfile
> > 
> > start the sysex transfer
> > 
> > when finished
> > press CTRL-C
> > the dumpfile will contain the dumped data.
> 
> O-me-god, it seems to work...! I got what seems to be
> the sysex dump I needed... What a wonderful OS!
> Thanks, Benno.

hehe , that's the advantage of of the "everything is a file in UNIX"
 concept.
:-)

> 
> > then to playback the data
> > first start sysex receive on your midi module
> > then do
> > cat dumpfile >/dev/midi00
> > 
> > which should send back the data to the midi port.
> 
> Could anyone confirm that? I've got an Elektron
> SIDStation and there is no other way to save custom
> programs than via MIDI/sysex. So if this does not
> work, I'll lose all my carefully crafted custom
> programs.
> Thanks a lot in advance.
>  - eric -

I do not want to be responsible for your data losses,
all my hints are without WARRANTY.
:-)

For example recodring a MIDI-song via cat will not work
since it is a stream of bytes without any timing information.
But in the sysex case there is no timing concept since it
is a raw data dump.
I am sorry that I can not try the reverse cat dumpfile >/dev/midi00
because of the lack of HW here.

it should work, but wait for someone confirming this.

Benno.
