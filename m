From: est@hyperreal.org
Date: Thu, 27 May 1999 14:21:33 +0000
Subject: latency killers..devourers of cpus
Message-Id: <marc-linux-sound-92799469503865@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Greetings!

I was wondering what the collective wisdom was about what things in
linux can monopolize the cpu for unpleasant periods of time.
Obviously such things are unpleasant for responsive sound software.
I'm particularly interested in things which can preempt even POSIX
`real-time' processes.  These would probably be things happening in
the kernel that aren't owned by any particular process.

Two examples that I've confirmed are:

* IDE drives..just forget it.

* Access to the /proc file-system, such as is done by ps(1) and
  top(1)..this is definitely a back-door to denial-of-cpu.

Also, does anyone know of good places to post this query?

Many thanks in advance! :)

E
