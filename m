From: =?iso-8859-1?Q?Jens_G=FCnther?= <guenthej@student.uni-kl.de>
Date: Tue, 20 Mar 2001 17:45:56 +0000
Subject: 2.4.x kernel: es1371 driver
Message-Id: <marc-linux-sound-98511855415300@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Thomas,

as your adress sailer@ife.ee.ethz.ch (from 2.4.2-ac20) seems to be wrong, I
send this to linux-sound@vger.kernel.org.

In the 2.4.3-pre4 and 2.4.2-ac20 config there is no way to specify the
I/O-port for the joystick when you build the driver into the kernel, although
the module seems to accept the "joystick=" option. Is this intentional? The
module parameter is mentioned in drivers/sound/es1371.c . There is no hint
concerning the I/O-port when building the driver into the kernel. Does it
have to be done by a kernel option?

When starting X the output volume is much lower than when using the 2.2.18
kernel.

Regards,
Jens
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
