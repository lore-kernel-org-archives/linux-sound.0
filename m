From: "Alexey" <sl@nikaa.dnttm.ru>
Date: Fri, 25 Jan 2002 14:19:41 +0000
Subject: CS4232 (Tropez plus)
Message-Id: <marc-linux-sound-101196998312122@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a Tropez plus soundcard with Cs4232 chip.
There is cs4232 kernel module for it. I followed all the instructions in
HOWTOs, the module loads propertly, without any error message, but:
xmms, for example, plays only one file and then my card keeps silent.
A year ago I left this problem and succeeded in using ALSA drivers.
After the Xfree 4.1.0 installation there appeared another bug: X mouse
driver cannot be initialized when ALSA cs4232 module is loaded, so cursor
hangs without any motion.
I think, there is a kernel module bug.
May be I'm to use some ISAPnP facilities, but I don't know, which of them.
Please, help.
Does anybody have Tropez plus? Your configuration files may be helpful.
Thanks in advance.
Alexey.

