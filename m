From: Michael Stutz <stutz@dsl.org>
Date: Thu, 17 Sep 1998 22:48:31 +0000
Subject: making wav sample of a big mp3
Message-Id: <marc-linux-sound-90609207319651@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I need to make a 15-second WAV sample from a 3-minute mp3 file that I have.
Does anyone know an easy way to do this?

(I thought the simplest way to do this would be to play the mp3 in one xterm
and use brec in another, but this doesn't work -- it would if I'd install
paudio, the package that adds a /proc/audio device. It's a sweet idea --
could this become a standard part of the kernel package?)
