From: Wilmer van der Gaast <lintux@lintux.cx>
Date: Thu, 21 Feb 2002 13:40:03 +0000
Subject: es1371 driver
Message-Id: <marc-linux-sound-101430199925056@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

(I found two addresses for Thomas, which one is the right one?)

Hello,

My computer has a SB PCI128 card and works perfectly with it. But, one
strange thing with the current Linux driver for it. Here a piece from
es1381_open:

	/* wait for device to become free */
	down(&s->open_sem);
	while (s->open_mode & file->f_mode) {
		if (file->f_flags & O_NONBLOCK) {
			up(&s->open_sem);
			return -EBUSY;
		}
		add_wait_queue(&s->open_wait, &wait);
		__set_current_state(TASK_INTERRUPTIBLE);
		up(&s->open_sem);
		schedule();
		remove_wait_queue(&s->open_wait, &wait);
		set_current_state(TASK_RUNNING);
		if (signal_pending(current))
			return -ERESTARTSYS;
		down(&s->open_sem);
	}

Why does it wait? When I play an MP3 and meanwhile accidentally visit a
website which uses Flash, the whole Mozilla process freezes because it can't
get /dev/dsp. Maybe all programs should be blamed for opening /dev/dsp
without O_NONBLOCK, but for me altering this piece of kernel code worked a
lot better. Now any open() is handled as O_NONBLOCK and I don't get those
crashes anymore.

Anyway, why this crashy behaviour by default? :-/


Greetings,

Wilmer van der Gaast.

-- 
*=-+-______________________
   |lintux-@t-lintux-d0t-cx:      _________________________________
   | http://www.lintux.cx/ |     /        Currently playing        \
   :http://www.algoritme.nl|    /         Oomph:DerNeueGott         \
    ~~~~~~~~~~~~~~~~~~~~~~-+-=-+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+-=*
