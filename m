From: Jeff Tranter <tranter@pobox.com>
Date: Tue, 01 Jun 1999 21:34:03 +0000
Subject: Re: Help with SoftOSS
Message-Id: <marc-linux-sound-92827358308032@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92825235904179@msgid-missing>
In-Reply-To: <marc-linux-sound-92825235904179@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have been able to use it. Briefly what I did was:

- download GUS samples from a site such as
  ftp://archive.cs.umbc.edu/pub/midia/instruments.tar.gz
- compile the SoftOSS driver as a kernel module
- load  modules using "insmod softoss2"
- test with an application that supports GUS, e.g.

   playmidi -g somefile.mid

Some other notes:

- the default is 32 voices, 32000 samples/sec
- you can configure (at kernel compile time) the number of voices,
  sampling rates etc..
- it slows down the machine significantly (tested on a 166MHz Pentium
   with a SB16 PnP)
- there were errors in playback and some MIDI files did not play at all
   (according to the vendor its still a proof of concept)
- you might want to explore using TImidity as an alternative to get
   the same results (i.e. high quality playback of MIDI files on a non-wavetable
  soundcard). I see significantly better results with this.

On Tue, 01 Jun 1999, DAVID BALAZIC wrote:
> Hi!
> 
> I'm trying to use SoftOSS ( kernel 2.2.9 ), but with no
> success yet. The kernel docs are pretty useless.
> 
> Is there any FAQ/HOWTO/whatever, that can help ?
> Anyone actually using it ?

--
Jeff Tranter (mailto:tranter@pobox.com http://www.pobox.com/~tranter)
I will not be pushed,filed,stamped,indexed,briefed,debriefed,or numbered.
