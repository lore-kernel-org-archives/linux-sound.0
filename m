From: Benno Senoner <sbenno@gardena.net>
Date: Sat, 17 Jun 2000 16:57:23 +0000
Subject: Re: Multimedia compression
Message-Id: <marc-linux-sound-96126233430028@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96119149930040@msgid-missing>
In-Reply-To: <marc-linux-sound-96119149930040@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 16 Jun 2000, paco@hydrofunk.org wrote:
> There's something called SHORTEN that does lossless compression of .WAV
> files. It produces .SHN files that are roughly 1/2 the size of the .WAV,
> but... you can't play a SHN file (yet).  You have to decompress it to a
> WAV and listen to it that way.  So, it's good for up/down-loading music
> and for archiving music.
> 
> You can whip up a little script to play CDs full of SHN files.  I did.  It
> just decompresses the SHN off of a CD and pipes the output directly to
> "play" so that I can keep twice the music on a single CD.

I tried shorten some time ago:

when using lossy compression you can achieve 1:4 - 1:5 but on soft passages
the sound is very crappy.

OTOH, when using lossless compression the gain is sometime minimal,
only 20% if you are unlucky.
Not much for my taste.

I prefer to use MPEG Layer 2 ( MP2) at 384kbit (lossy) which outperforms all MP3
based codecs even 320kbit. 

Do you think that in future it will be possible to squeeze out even more
redundancy out of PCM audio using lossless compression ?
( 1:3 - 1:5 would be really cool, but I think there will be no hope ...
audio is just too unpredictable.

OTOH, one way to achieve great compression with little distorsion would be 
decomposing the audio stream in it's elementary "instruments", like
drumset , guitars ,violines , bass etc, and then code a sort of MIDI-like file
(very short) with the "samples" stored in the stream only once.

I think MP4-SAOL is a step in that direction.

Perhaps John Lazzaro could give us more insights regarding this field.

I know that the goal will be "statistically indistinguishable from CD" sound,
just like AAC 128kbit or  MP3  > 160-192kbit  does. ( no folks, those believing
MP3 128kbit = TRUE CD quality are completely FOOLISH),
but I am just curious what the achievable compression ratio will be , when
compressing a typical pop, rock, techno, classical  song using structured
audio.
Will 1:20 , 1:30 be possible in future ?

cheers,
Benno.
