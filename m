From: Jaroslav Kysela <perex@suse.cz>
Date: Tue, 26 Oct 1999 21:18:17 +0000
Subject: Re: [linux-audio-dev] External MIDI Sync using OSS/Free
Message-Id: <marc-linux-sound-94097385018891@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94095789529102@msgid-missing>
In-Reply-To: <marc-linux-sound-94095789529102@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 26 Oct 1999, Jaroslav Kysela wrote:

> >   What about syncing multiple soundcards?  I've found this to be next to
> > impossible under thud using OSS.
> 
> No probs.

Oops. Before I receive some flames, the correction is here:

There are problems with different clock sources for the chips on multiple
soundcards. ALSA driver currently doesn't support multiple soundcards
which can be synced together. The new PCM API covers this possibility,
but the driver for some hardware, which supports this feature, has not
been written yet.

						Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
SuSE Linux    http://www.suse.com
ALSA project  http://www.alsa-project.org
