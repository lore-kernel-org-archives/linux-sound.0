From: Jaroslav Kysela <perex@suse.cz>
Date: Wed, 27 Oct 1999 11:54:01 +0000
Subject: Re: 4D-NXs (was Re: Sync Issues)
Message-Id: <marc-linux-sound-94102551404150@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94102459902838@msgid-missing>
In-Reply-To: <marc-linux-sound-94102459902838@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 27 Oct 1999, Billy Biggs wrote:

>   4D-NX seems to be just the chipset.  Which card are you referring to
> here?  And, how does it get so many seperate openable channels?

32 stereo channels, mixing is performed by hardware

>   More importantly, would I be able to sync channels on the same sound
> card?

Yes, with the new PCM v2 ALSA API (currently in development - I welcome
testers).

1) load the playback buffers
2) send SYNC GO command to the driver

You may create more syncronized groups, of course.

						Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
SuSE Linux    http://www.suse.com
ALSA project  http://www.alsa-project.org
