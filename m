From: Alamais <alamais@softhome.net>
Date: Fri, 18 Sep 1998 04:03:02 +0000
Subject: Re: gmod and xmp, cannot open /dev/sequencer !
Message-Id: <marc-linux-sound-90610241723334@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90586345324981@msgid-missing>
In-Reply-To: <marc-linux-sound-90586345324981@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Alexis DOMJAN wrote:
> 
> Hello,
> 
> I have an AWE32 properly configured. I can play the midi files using
> the wavetable without any problem. However if I try to use gmod or xmp
> modules players they cannot open /dev/sequencer. However the device
> can be opened with drvmidi to play the midi files. Exactly it says:
> ...

mod,xm,s3m,etc files include their own samples, 
and [do not/should not] use the midi sequencer. 
The players should be trying to open /dev/dsp, 
or whatever the AWE32 uses for wave audio.

-- 
Alamais -> alamais@softhome.net
Don't just do something, stand there and ponder!
