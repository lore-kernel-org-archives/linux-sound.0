From: Bill Nottingham <notting@redhat.com>
Date: Thu, 22 Apr 1999 03:35:41 +0000
Subject: Re: /dev/midi apps
Message-Id: <marc-linux-sound-92475265311807@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92462758903047@msgid-missing>
In-Reply-To: <marc-linux-sound-92462758903047@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Bertrand Lee (bertrand@ieee.org) said: 
> Are there any apps that use /dev/midi for playback/recording?

If you mean the external midi/MPU401 device, playmidi supports
playback to it via the -e switch. Recording I'm not sure about.

> All the apps that I have come across (rosegarden, playmidi, etc.) seem to
> use /dev/sequencer, which my soundcard (es1370) does not support.

Yup, the es137x do not have a hardware midi sequencer. To play
files, you'd most likely have to use something like timidity.

Bill
