From: Benno Senoner <sbenno@gardena.net>
Date: Thu, 17 Jun 1999 23:03:59 +0000
Subject: Re:  New scheduling latencies during audio playing + heavy disk I/O on various kernels
Message-Id: <marc-linux-sound-92965722527786@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92948447502258@msgid-missing>
In-Reply-To: <marc-linux-sound-92948447502258@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 17 Jun 1999, Juhana Sadeharju wrote:
> >From:	Benno Senoner <sbenno@gardena.net>
> >
> >audio FX, harddisk recording .. , DURING HIGH DISK ACTIVITY,
> >
> >Unfortunately the answer is NO, with current kernels.
> 
> Your last test had an unlimited disk activity but in an audio application
> the disk activity is limited by number of channels times the sample rate.
> (We just have to make sure that the audio application is only serious
> disk user.)

The point is that your audio application can to control external programs.

example: assume you play on your MIDI keyboard notes which go into a
linux software synthesizer which must use <20ms audio buffers so that you don't
notice the the delay (between a MIDI keystroke and the output of the sound from
the soundcard) while playing your song.

If for some reason disk activity occurs, (for example because GIMP is just
saving your 10MB  JPG picture on disk),
there is a high probability that sound dropouts may occur.
   
> How about testing it too? Does it really make difference?
> I think it makes because your current tests seems to not be limited
> in any reasonable way.

Yes, if you write 150Kb/sec (in background) during audio playing, you will get
fewer sound dropouts, than writing at maximum rate,
but actually the kernel give no guarantee that the RT scheduled ram audio
player, will not block <20ms

> 
> >what helped alot is the remount of the disk in sync mode
> >( mount / -oremount,sync )
> >in this case the average scheduling latencies are very good
> >between 16-19ms during the disk stressing tests.
> 
> Did you measure the wall clock time used to copy (whatever) the file
> in both cases? I have feeling that it took longer to copy the file,
> i.e., the same effect what is gained by limiting the disk activity.
> So, perhaps we reach the < 20 ms latencies just by using the disk the
> way audio software uses it.

in sync mode the disk really SUCKS, I don't made any benchmarks but I can say
the disk is SEVERAL times slower ( >5 or so).

But  I think that the reason because in sync mode you get these nice low-latency
results, is that the kernel blocks for fewer time, because it writes smaller
pieces at time but more often.  

> 
> But surely a change to kernel would make it possible to limit the disk
> activity in favor of RT scheduling.

This is the main thing which must happen to enable Linux to run realtime
audio-applications.
 
I think it's a very important feature, which should be included before kernel
2.4 comes out, to enable vendors to port their nice audio apps to Linux.


Alan said:
"One day in the future the audio layer has to run without the kernel lock.
However by then its likely to be ALSA. Getting the SMP locking right will
be fun, I dont think its worth repeating the effort for dead code (ie OSS),
nor will it help you anyway as your lock understanding isnt quite right"

Alan, do you know if MIDI I/O or serial I/O suffer of high scheduling
latencies in a similar manner like audio I/O when heavy disk I/O is performed ?

I ask this because a classic MIDI software synthesizer works as follows:

while(1)
{
  read() MIDI note from MIDI interface
  render the audio in a small buffer
  write() buffer to /dev/dsp
} 


therefore even if the write() to /dev/dsp has no locks anymore, the read() of
the MIDI note need low latency too, 
what if the note is read from a MIDI interface connected to a standard serial
port ? ( are there some disadvantages over the soundcard's own MIDI port ?)

regards,
Benno.

sbenno@gardena.net
