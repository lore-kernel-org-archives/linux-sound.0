From: Chris Bagwell <cbagwell@tddtx.fujitsu.com>
Date: Tue, 22 Sep 1998 15:21:11 +0000
Subject: Re: compression tools
Message-Id: <marc-linux-sound-90648485416675@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90634456129446@msgid-missing>
In-Reply-To: <marc-linux-sound-90634456129446@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I can only speak from the point of view of *free*.  Best quality is only
going to come with buying something from the likes of RealAudio.

Besides that, I've had good luck with various ADPCM formats.  Both IMA
ADPCM and Microsoft ADPCM can convert 16-bit audio into 4-bit audio
which results in a considerable compression.  Plus realtime
compression/decompression is easy on even limited machines (even 386s). 
Sound quality holds up remarkably well.  Right now its probably easiest
to convert your samples into .wav files under windows as it includes
codecs for both of those versions.

I've implemented the decoder portion into sox but haven't gotten around
to adding the encoder (although the algorithms are readily available). 
You could use that to listen to the streaming audio.  IMA ADPCM was
designed to support streaming (recovery from lost blocks of data)
although I haven't seen any decoders take advantage of this.  You can
grab a copy of sox with this support from:

http://home.sprynet.com/sprynet/cbagwell/projects.html

There is also a RAW IMA ADPCM encoder/decoder available on the net that
compiles under most versions of unix.  Do a search for adpcm.shar.

Hope it helps,
Chris

Florin Andrei wrote:
> 
> I need some real-time compression tools, wich can provide a reasonable
> sound quality and a good compression ratio.
>         I tried gsm-toast, but it sounds awfully when i put music through it.
> Some mpeg will be fine, but the compression speed is bad, or so i think
> after seeing 8hz how it converts a 52 seconds wav during 4 minutes and a
> half!!! (this was on a PII 233). This could not be real-time!
>         I need this thing in order to transmit *music* over a 33.6 kbps
> connection, at the best quality possible.
>         I tried netstreamer, but at 16 kHz sampling ratio still sounds not so
> well.
>         Any suggestions?
> 
>                                         Florin Andrei

-- 
          Chris Bagwell              |  Fujitsu Network Communications
 mailto:cbagwell@tddtx.fujitsu.com   |         Richardson, Texas
