From: ford@omnicron.com (Mike "Ford" Ditto)
Date: Thu, 17 Sep 1998 20:14:21 +0000
Subject: CW-7502 -> cdda2wav -> zeroes
Message-Id: <marc-linux-sound-90607851214906@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I am trying to use Cdda2wav version 0.8 to read audio tracks from a
Panasonic CW-7502 (which is widely reported to have good CDDA reading
capability).  The program can read and display the TOC correctly and it
writes the correct number of bytes into the output file, but all of the
audio samples are zero (total silence).

Why don't I get the actual audio data?

Thanks in advance for any help or advice,

					-=] Mike [=-

Linux 2.0.33 on x86
SCSI Adapter: Adaptec AHA-294X Ultra SCSI host adapter
Host: scsi0 Channel: 00 Id: 06 Lun: 00
  Vendor: MATSHITA Model: CD-R   CW-7502   Rev: 4.10
  Type:   CD-ROM                           ANSI SCSI revision: 02

Here is a sample run with output to my "hist" program which prints out
the number of bytes with each byte value.  cdda2wav in raw mode outputs
nothing but zero bytes for me.

cdda2wav -O raw - | hist
Cdda2wav version 0.8
track pre-emphasis copy-permitted tracktype channels sub-Q-channel
 1-18           no             no     audio        2 position
Table of Contents: total tracks:18, (total time 52:37.97)
  1.( 2:47.16),  2.( 3:13.27),  3.( 2:32.80),  4.( 2:47.71),  5.( 2:49.20)
  6.( 2:08.36),  7.( 3:59.33),  8.( 2:05.37),  9.( 3:22.23), 10.( 2:39.64)
 11.( 3:20.93), 12.( 3:17.33), 13.( 3:16.29), 14.( 3:28.91), 15.( 2:35.53)
 16.( 2:11.27), 17.( 3:00.33), 18.( 2:59.87)

Table of Contents: starting sectors
  1.(      33),  2.(   12570),  3.(   27065),  4.(   38525),  5.(   51103)
  6.(   63793),  7.(   73420),  8.(   91370),  9.(  100773), 10.(  115940)
 11.(  127913), 12.(  142983), 13.(  157783), 14.(  172505), 15.(  188173)
 16.(  199838), 17.(  209683), 18.(  223208), lead-out(  236698)
recording 167.16000 seconds stereo with 16 bits @ 44100 Hz ->'standard output'...
samplefile size will be 29487024 bytes.
0x00 29487024
