From: Dave Mielke <dave@mielke.cc>
Date: Tue, 04 Apr 2000 01:13:48 +0000
Subject: Re: Recording with SB16?
Message-Id: <marc-linux-sound-95481116912202@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95480596808537@msgid-missing>
In-Reply-To: <marc-linux-sound-95480596808537@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[quoted lines by Peter Leif Rasmussen on April 3, 2000, at 10:49]

>I could get some faint recording through the mike input, but I wasn't
>able to get anything properly through the line input, even though the
>sound from there would go clearly to the speakers connected to the speaker
>output.

You need to configure your mixdr properly. To do this, use the "aumix" command.
Do "aumix -q" to see what your current settings are. It should look something
like this:

   aumix -q
   vol 78, 80
   bass 50, 50
   treble 50, 50
   synth 75, 75, P
   pcm 75, 75
   speaker 0, 0
   line 75, 75, R
   mic 0, 0, R
   cd 85, 85, P
   mix 0, 0
   igain 75, 75
   ogain 75, 75

These happen to be my mixer settings at this very moment. You'll notice that
each line has either three or four columns. The first column is the name of the
setting which its line describes. You may have a different set of names than I
do, as "aumix" only shows those settings which your sound card actually
supports.

The second column is the left channel percentage, and the third column is the
right channel percentage. You can see from the above, for example, that my main
output volume is ever-so-slightly balanced toward the right because its left
channel percentage is 78 whereas its right channel percentage is 80. To change
the volume to 90%, for example, issue the command "aumix -v 90".

Some of the lines have a fourth column which is either P (play) or R (record).
These are the mixer inputs, and the ones without this column are the mixer
outputs. If a mixer input is set to P, then you'll be able to hear it through
your speakers, but you'll be unable to record from it by reading from either
/dev/dsp or /dev/audio. If you would like to record from it, then you'll have
to change its setting to R. To change the CD mixer input from play to record,
for example, issue the command "aumix -c R" (note that the R is uppercase). To
change it back to play, issue the command "aumix -c P".

To summarize: Make sure that the mixer inputs from which you would like to
record are not only set to a high enough percentage, but also set to R
(record). If you would like to listen to a mixer input while you're recording,
but would not like it to get recorded, then make sure that it's set to P
(play).

>but also
>very distorted recording. 

The default setting for sound card I/O is 8-bits, and, since this does not
offer very much granularity, this usually results in a very noticeable amount
of background distortion. When the mixer input level is very low, the sound
that you're trying to record tends to get burried in the distortion. Increasing
the mixer input level will go a long way to overcoming this probem, but it will
not eliminate it. The way to get rid of all of the distortion is to tell your
recording application to use 16-bit samples.

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
