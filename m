From: Steve Netting <steve@moonfoundation.co.uk>
Date: Sat, 15 Jul 2000 14:52:27 +0000
Subject: Re: Midi / SysEx - Dump / Linux?
Message-Id: <marc-linux-sound-96367272709995@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96349816311777@msgid-missing>
In-Reply-To: <marc-linux-sound-96349816311777@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

<Benno - if this doesn't make it out to the list - could
 you forward it?   I've been having email noghtmares recently!>

 < snip >

> > Could anyone confirm that? I've got an Elektron
> > SIDStation and there is no other way to save custom
> > programs than via MIDI/sysex. So if this does not
> > work, I'll lose all my carefully crafted custom
> > programs.
> > Thanks a lot in advance.
> >  - eric -

 <snip?

> I am sorry that I can not try the reverse cat dumpfile >/dev/midi00
> because of the lack of HW here.
> 
> it should work, but wait for someone confirming this.

 Yes, does indeed work - tested using an Alesis MMT-8 sequencer
 dumping it's memory via midi ... and a Korg N1 synth dumping all
 it's programs settings etc.  All restores without any problems.

 Thanks to all who replied!   I should have though of that myself,
 but well... I really didn't think it was that easy.

 I'll probably knock up a script to make the whole process more
 user-friendly, and provide some sort of menus for dumping/
 restoring data...


Thanks again!


Steve
--
http://www.moonfoundation.co.uk
--
- Steve Netting - Logica Aldiscon, Bristol, UK
