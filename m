From: Benno Senoner <sbenno@gardena.net>
Date: Tue, 31 Aug 1999 09:53:42 +0000
Subject: Re: hdparm...
Message-Id: <marc-linux-sound-93609322100042@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93608992629994@msgid-missing>
In-Reply-To: <marc-linux-sound-93608992629994@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 31 Aug 1999, Jair-Rohm wrote:
> >%_High;
> 
> I followed a thread for a while concerning mp3 playback performance on Linux boxes. Benno suggested using 'hdparm' to tune EIDE hard disks. I am running Red Hat 6 on a p133 laptop with 16 megs of ram. I use sox, MixViews, Cecilia, snd and BladeEnc for mp3 encoding. My mp3 player is X11Amp. To date, i've not had any problems with resources. Surfing with Netscape while processing a file in Cecilia and having a couple of terms open presents no strain. Things run smoothly. Which leads me to the question, "...hmmm...can things be better?". 
> The man page for 'hdparm' mentions something about use of the '-m' option potentially resulting in "...massive filesystem corruption." This of course if your EIDE drive "lies" about its support for multiple mode.
> 
> Anyone have any experience with this?
> 
> Thanks
> 

The problem is not the P133, the problem is the disk.
On a non DMAed disk the kernel must do some busywaiting loops (polling) and
this introduces latencies which are up to 1-2secs, which is bigger than
the audiobuffer size on most soundcards.

x11amp when run as root, runs with realtime privileges, which helps, but can't
avoid the skipping completely in case of heavy disk load.
Just try to do
dd if=/dev/zero of=testfile bs24 count0000
(generates a 100MB file)
while playing an mp3 with x11amp,
there will be a skip sometime.

Then try it again on a 2.2.10 kernel with Ingo's lowlatency-2.2.10-N6B patch
(you can find it on my audiopage).
You will not hear skips anymore. (except if your mp3 player use very small
buffers, on my PII I can go as low as 4ms)

About the -m8 flag , the "disk corruption" may happen only on very old drives,
I never had problems with it ranging from old 260MB WD disks to recent IBM 16GB
UDMA drives.


Benno Senoner
E-Mail: sbenno@gardena.net
Linux scheduling latency benchmarks
http://www.gardena.net/benno/linux/audio
