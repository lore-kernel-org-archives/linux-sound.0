From: Sangohn Christian <sango-ch@reze-1.rz.rwth-aachen.de>
Date: Fri, 18 Jun 1999 15:16:36 +0000
Subject: cdda2wav as user
Message-Id: <marc-linux-sound-92974250106959@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello there!

I have problems running cdda2wav as user (as root everything is OK).
Here is the output:
bash-2.01$ cdda2wav -J open(0,0,0) in file interface.c, line
857: open error for scsi device: No such file or directory On Linux make sure
you have the generic SCSI driver installed. Probably you did not define your
SCSI device. Set the CDDA_DEVICE environment variable or use the -D option.
You can also define the default device in the Makefile.

How can fix that?

--
   ,---._________________________________
  /                                      \   |~~\_____/~~\__  |
 | Christian.Sangohn@post.rwth-aachen.de  >---\______=== )-+
 |  ,---._______________________________/            ~~~|/~~  |
 |/                                                     ()
