From: Jay Johnston <jajohnst@cs.vassar.edu>
Date: Fri, 29 Jan 1999 03:50:51 +0000
Subject: spice up your life...
Message-Id: <marc-linux-sound-91758189214563@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

sorry.  i had to.  here's what i wanna do...and i can't figure out the
easy way (ha!) to do it, but i'm sure there must be one.  i have my
desktop and my laptop linked with ethernet and my desktop is hooked up
to my stereo.  my desktop is mounted on the laptop through nfs.  say i
wanted to play sound on the desktop (and therefore through the stereo)
from the laptop...

cat <soundfile> > /mnt/<desktop>/dev/dsp

doesn't work, and 

cat <soundfile> > /mnt/<desktop>/dev/audio

plays the sound on the laptop.  this is sorta expected, since they're
not regular files.  is there any way to set this up so that all sound
played on the laptop is routed to the desktop...possibly without a
server such as NAS?

thanks, jay
