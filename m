From: Jaroslav Kysela <perex@suse.cz>
Date: Tue, 26 Oct 1999 21:10:22 +0000
Subject: Re: [linux-audio-dev] External MIDI Sync using OSS/Free
Message-Id: <marc-linux-sound-94097369418622@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94095789529102@msgid-missing>
In-Reply-To: <marc-linux-sound-94095789529102@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 26 Oct 1999, Billy Biggs wrote:

>   I wish there were a better way to sync audio though, specifically sync
> of audio to MIDI.  /dev/dsp has a crappy interface to this.  Does ALSA
> provide any reasonable mechanism of syncing different inferfaces?
> 
>   In OSS, the clock between outgoing and incomming MIDI aren't the same.
> In ALSA, I'd hope that would be fixed.  Does audio and sequencer also have
> the same clock?

Yes, if you choose the PCM device as the timer source.

>   What about syncing multiple soundcards?  I've found this to be next to
> impossible under thud using OSS.

No probs.

						Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
SuSE Linux    http://www.suse.com
ALSA project  http://www.alsa-project.org
