From: Ramya Desai <ramya.desai@gmail.com>
Date: Tue, 23 Nov 2010 12:33:21 +0000
Subject: Writing a driver for Sound Card
Message-Id: <AANLkTik6kCAdc-4YnSR1bt+_RC-khGu2RcYut9Ywo7rg@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dear All,

I am new to this Linux Sound driver architecture (ALSA). I developed a
few drivers in Linux kernel environment for PCI based devices which
are of type character and block. I am going through the following link
for writing a driver for my custom sound card.

http://www.kernel.org/pub/linux/kernel/people/tiwai/docs/writing-an-alsa-driver.pdf

I have a doubt about the Linux sound driver architecture. I need to
develop the driver with mixer, player, recorder, MIDI etc. components.
Do I need to develop these components in single driver OR Do I need to
develop as a individual component (one driver for one component).

I looked into the /usr/src/linux-2.6.35/sound directory. I did not
understand it completely. Is there any driver (sample) which I can go
through?

Please let me know.

Any help greatly appreciated and helpful to me.

Thanks and Regards,
Srinivas G
