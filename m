From: Bill Nottingham <notting@redhat.com>
Date: Mon, 26 Jul 1999 21:01:21 +0000
Subject: Re: Ensoniq Audio PCI ES1370- no CD-Audio !
Message-Id: <marc-linux-sound-93302376610530@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93302376110504@msgid-missing>
In-Reply-To: <marc-linux-sound-93302376110504@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

David Jander (djander@alumnos.utfsm.cl) said: 
> 1.- CD-audio does not sound: Apparently the mixer DOS not support the CD-audio
> channel correctly, is that true ? Anybody knows about this issue ? Any
> newer kernel/driver version fixes this ? Maybe ALSA ? 

Set the CD audio as the recording source - that should cause it
to work (this is fixed under ALSA, IIRC.)

Bill
