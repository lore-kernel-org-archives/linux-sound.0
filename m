From: Erik de Castro Lopo <erikd@zip.com.au>
Date: Sun, 14 Mar 1999 20:10:20 +0000
Subject: WAV players (was Re: awe64 not initializing on 2.2.2)
Message-Id: <marc-linux-sound-92144274022938@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Michael B. Trausch wrote:
> 
> Some .WAV files (most notably any that were introduced in the Windows 95
> era) don't play at all-- they're just garble.

There are over thirty different kinds of .wav files. Utilities like
wavplay can only play the PCM encoded type (fortunately the most 
common). The palyer included with SoX can also play ADPCM encoded 
wav files.

> 
> And many, if they're not garble, they play at 1/2 the speed of normal
> playback.  Solution:  Get a program that supports these files.

Yep. I do recomend the player that comes with SoX.
See : http://home.sprynet.com/~cbagwell/sox.html

> I'm not sure where to look, but I'm sure that Freshmeat wouldn't be a bad
> place to start.

http://www.bright.net/~dlphilp/linux_soundapps.html is even better for audio 
stuff.

Erik
-- 
+-------------------------------------------------+
     Erik de Castro Lopo     erikd@zip.com.au
+-------------------------------------------------+
"640K ought to be enough for anybody."  -- Bill Gates, 1981
