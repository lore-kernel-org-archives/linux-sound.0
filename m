From: Kai Vehmanen <kaiv@wakkanet.fi>
Date: Tue, 13 Jul 1999 01:01:40 +0000
Subject: Re: Sound card with S/PDIF input (and output) wanted
Message-Id: <marc-linux-sound-93183146131711@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93102609320130@msgid-missing>
In-Reply-To: <marc-linux-sound-93102609320130@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 12 Jul 1999, Paco wrote:

>> It's funny how slow the soundcard development has been when 
>> compared to other computer components. 
> Part of this is slow develpoment is due to human hearing limitations.  I
> may be slightly off on the numbers, but I believe the human ear will 'max
> out' at 50KHz sample rate.  Anything above and beyond this rate creates
> absolutely *no* improvement in sound quality to the human ear.  We

Well, the upper limit for human hearing is around 20kHz (although
there are exceptions, even over 22kHz!). And as Nyquist's sampling
theorem says, 40kHz is enough to represent a 20kHz signal. But
in reality, it isn't so simple. In sound synthesis, the lack of 
frequency head-room when using 44.1/48kHz sampling freqs causes
problems. Same goes for sample resolution. 16bit is fine for normal
playback, but when you are recording, using 20bit samples helps 
enormously as it gives more head-room. You can record safely without
clipping and still have a decent dynamic range. 

> The other part of this slow development is a 'supply/demand' issue.  Most
> people don't really even *need* a full-dpulex card at all.  They use
> their sound cards for games/MP3s/etc (ie, only *playing* sound files).  A
> _small_ percentage of them ever do any recording, and an even _smaller_

Well, situation is changing. Internet phone-systems, voice control 
(Os/2 v3.0 aka Merlin brought this to the masses), multitrack
recording, using you computer for listening music (mp3s), format
conversions (vinyl -> cd transfers), ... Well, not all need
full-duplex, but still, normal people might want to do these things.

> Granted, the output of this second audio device leaves much to be desired,
> but the only person who ever hears the sound out of this second device (in
> my case, at least) is me.  I do multi-track recording, so I have to listen
> to a scratchy bass guitar through the 8-bit device as I lay down the
> rhythm guitar through the 16-bit device, but I see this as only a minor
> annoyance since the final mix-down of all the tracks that I record sounds
> just fine when it's all said and done.

Okay, you can do multi-track recording, but what if you wanted to 
use your computer as a FX-processor? 8bit just isn't enough for 
this. And the otherway around, you might want to recycle the tracks 
you recorded through some external fx-gear. This too, definately 
needs 16bit full-duplex.

> The AWE64 packs alot of bang for the buck, IMHO.  I can do all of my
> recording with this one sound card.  I have my complaints about the card,
> too, so don't get me wrong, but you can't expect professional quality
> recording from a card that only costs $35 brand new.  You get what you pay
> for.

I can say all that about my GUSMAX, but it cost less and I bought
it two or three years ago. It just sounds unbelievable. At the 
time I bought my GUS, I had a 486 with 8MB of memory...

Ok, I admit that AWE64 has better MIDI-features and the DAC isn't
bad either, but still... hopefully this will change soon.

-- 
Kai Vehmanen ----------------------------- CS, University of Turku, Finland
 : email                                 mailto:kaiv@wakkanet.fi
 : home page, projects, etc              http://www.wakkanet.fi/~kaiv/
 : my music (ambient-idm-rock-...mp3/ra) http://www.wakkanet.fi/sculpscape/
