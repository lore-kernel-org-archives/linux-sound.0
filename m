From: Meelis Roos <mroos@linux.ee>
Date: Tue, 15 Feb 2000 16:55:55 +0000
Subject: Re: /dev/audio, /dev/dsp not running for an es1371
Message-Id: <marc-linux-sound-95063495617197@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95060250626587@msgid-missing>
In-Reply-To: <marc-linux-sound-95060250626587@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

JFO>   The sndconfig detects an Ensoniq card, for which it
JFO> installs an es1371 module in /etc/conf.modules

Correct, This card uses an Ensoniq chip. Creative bought Ensoniq to get
a PCI card out quickly.

JFO>   However, a 'cat /dev/sndstat' then reports
JFO> "no device with this type", and the /dev/audio0
JFO> and /dev/dsp0 don't appear in their directory.

/dev/sndstat only works for drivers that use the OSS API. Newer cards
(esp. PCI) us a more low-level API (sound_core) and so it's normal that
sndstat doesn't know about them.

JFO>   So, a try for reading from anyone either of the 
JFO> /dev/audio or /dev/dsp with the command:
JFO>  'dd bs=8k count=5 </dev/audio > sample.au'
JFO> or the same with /dev/dsp... It doesn't read
JFO> anything, such that the sample.au file
JFO> contains always the same character, indicating
JFO> that there is only a silence.

Beware that this card may need a different type of microphone. Our
1371's down't work with the old microphones that we use with SB16.

JFO>   Although, under the Gnome Windows Manager,
JFO> the sounds appear fine for any events they
JFO> are set up for.

So it probably just works as much as it is supposed to. Read the docs
about ES137* drivers!

-- 
Meelis Roos (mroos@tartu.cyber.ee)
