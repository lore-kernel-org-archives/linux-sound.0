From: Dave Mielke <dave@mielke.cc>
Date: Mon, 30 Aug 1999 22:49:32 +0000
Subject: Playing midi files with 2.0.38 kernel.
Message-Id: <marc-linux-sound-93605417803976@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi:

The 2.0.38 kernel, with no modifications, defines MAX_MIDI_DEV to be 6. Ioctl
of SNDCTL_SEQ_NRMIDIS, however, returns 0. Does anyone know what, if any,
special parameters/configurations I need to do so that midi files can be played
with the 2.0.38 kernel?

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
