From: Bill Nottingham <notting@redhat.com>
Date: Wed, 30 Sep 1998 18:03:38 +0000
Subject: Re: PCI Soundcards???
Message-Id: <marc-linux-sound-90717860804233@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90717751403473@msgid-missing>
In-Reply-To: <marc-linux-sound-90717751403473@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

'Terra NovA' B. Loeding (bloeding@u.washington.edu) said: 
> Ok. Anyone out there know if there are any kernal patches for PCI
> soundcards yet? ie. the SoundBlaster PCI64... If not, can anyone
> comment on any projects or plans to create these drivers?

Use the es1370 driver, available in 2.1.late, or Alan Cox's sound
port for 2.0.3x (ftp://ftp.linux.ork.uk/pub/linux/alan/Sound/). Or
grab it straight from Thomas Sailer's pciaudio page:
http://www.ife.ee.ethz.ch/~sailer/linux/pciaudio.html

Bill
