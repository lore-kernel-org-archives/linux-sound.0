From: Paco <paco@OhKeePa.Net>
Date: Tue, 04 Apr 2000 02:37:17 +0000
Subject: Re: Recording with anything?
Message-Id: <marc-linux-sound-95481952516350@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95480718509450@msgid-missing>
In-Reply-To: <marc-linux-sound-95480718509450@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi...

I've got the SB PCI512, which uses the same chipset as the Live!, 
and I've got the same problem.  No matter what I do I am unable
to record a thing.  I don't think the support for the emu10k1
chip is quite up to speed yet, but...

Which drivers are you using?

If you're using OSS/Commercial drivers (like I am), you should
write to 4front technologies and tell them.  I've had some long
talks with them , but they just keep gauranteeing me that the
drivers work fine.

You can get the address form their website: http://www.opensound.com

If you're using the ones from Creative Labs themselves (via ALSA),
well... I'v never gotten those to do anything for me... not even
play audio.

I just think our cards are a bit too new for Linux.  8^)

peace,
-Paco

Jonathan Oppenheim wrote:
> 
> i cannot record anything, although no trouble
> hearing sound through both the mike and line in.
> 
> no program seems to want to bother even trying to record.
> 
> for example, SLAB, just sits there, with the counter stopped
> at 0 after pushing the REC PAUSE and then the PLAY button.
> I can hear myself play, but it makes no attempt to record any sound.
> 
> Likewise, using kvoice, i push record, in the new greeting dialogue
> box, and the new greeting message window just disappears, and that's it.
> 
> i also try typing "dd bs=8k cound=4 </dev/audio > sample.au"
> 
> this creates the file sample.au but the file is empty
> (at least, i see nothing when i type "more sample.au" or "kedit
> sample.au", but it must have something in it, because it is 32768 bytes
> long)
> 
> i have a soundblaster live! card, under mandrake 7.0
> when i configured the card (using sndconfig) it found
> the card without any problem.
> 
> perhaps an interupt problem??
> 
> any help would be appreciated.
> 
> thanks,
> jonathan
