From: Bill Nottingham <notting@redhat.com>
Date: Sun, 31 Jan 1999 17:45:41 +0000
Subject: Re: Esoniq Sound Baster PCI 64
Message-Id: <marc-linux-sound-91780516519318@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91778682012308@msgid-missing>
In-Reply-To: <marc-linux-sound-91778682012308@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Tony Nugent (Tony.Nugent@usq.edu.au) said: 
> The sndconfig utility correctly identified that card, and the sound
> worked.  So now, running "/etc/rc.d/init.d/sound start" the soundcore
> and es1370 modules get loaded.  Quake 1 & 2 work just great, full
> sound with no breakup (finally!)  But using "play" (ala "sox") results
> in ugly static-like noises.

The es1370 driver doesn't support some sample formats; that could
be the problem here.

> %  cat /dev/sndstat
<snip>
> Also very weird.  According to this, the card isn't working at all :)

The PCI drivers (ES1370/ES1371/S3 Sonicvibes) don't support the
/dev/sndstat interface; therefore, nothing will show up there.

> When attempting to use a midi player or using the sfx* programs
> (sfxload, sfxtest), I get:
> 
> open /dev/sequencer: Device not configured
> 
> Huh?

The es1370/es1371 don't actually support hardware wavetable; it's
done in the drivers on the Windows side.

Bill
