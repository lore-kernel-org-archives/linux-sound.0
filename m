From: est@hyperreal.org
Date: Thu, 28 Oct 1999 16:06:55 +0000
Subject: oolaboola extensibility to the rescue
Message-Id: <marc-linux-sound-94114186215843@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

It's nice when, occasionally, something just works easily. :)

I've been transcribing an interview and finding my microcasette
recorder quite cumbersome to use.  I realized that a traditional
dictaphone setup would be much more productive.  This involves (a)
playing the `tape' while a pedal is depressed and (b) pausing and
backing up a little when it's released.  A MIDI sustain pedal and the
following code in my .oola/rc file created this for me.

dicta_backup = 5

def dicta_control(pn, gop = 0):
  if (gop):
    players[pn].unpause()
  else:
    players[pn].pause()
    players[pn].newpos(players[pn].posf - dicta_backup)

mi.cb['control-change'][1][64] = lambda v: dicta_control(0, v >= 64)

Eric
