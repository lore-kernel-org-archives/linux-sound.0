From: Jaroslav Kysela <perex@suse.cz>
Date: Sat, 30 Oct 1999 16:06:32 +0000
Subject: Re: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94130036217368@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94097346918347@msgid-missing>
In-Reply-To: <marc-linux-sound-94097346918347@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 29 Oct 1999, Benno Senoner wrote:

> > > BTW: which card are you using ?
> > 
> >   For MIDI I'm using a Roland MPU-IPC-T card.  MPU-401.
> 
> Jaroslav do you know if there are similar problems on this card with too little
> MIDI TX/RX FIFO size  , and/or lack of an IRQ connected to it ?

Yes, the problem is in the MPU-401 hardware specification. This hardware
haven't the TX interrupt. Every soundcard with the standard MPU-401
emulation has this problem.

							Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
SuSE Linux    http://www.suse.com
ALSA project  http://www.alsa-project.org
