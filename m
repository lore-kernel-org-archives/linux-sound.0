From: Sangohn Christian <sango-ch@reze-1.rz.rwth-aachen.de>
Date: Sun, 20 Jun 1999 16:44:46 +0000
Subject: Re: cdda2wav as user
Message-Id: <marc-linux-sound-92990931801517@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92974250106959@msgid-missing>
In-Reply-To: <marc-linux-sound-92974250106959@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 20 Jun 1999, Benno Senoner wrote:
SC>On Fri, 18 Jun 1999, Sangohn Christian wrote:
SC>> Hello there!
SC>> 
SC>> I have problems running cdda2wav as user (as root everything is OK).
SC>> Here is the output:
SC>> bash-2.01$ cdda2wav -J open(0,0,0) in file interface.c, line
SC>> 857: open error for scsi device: No such file or directory On Linux make sure
SC>> you have the generic SCSI driver installed. Probably you did not define your
SC>> SCSI device. Set the CDDA_DEVICE environment variable or use the -D option.
SC>> You can also define the default device in the Makefile.
SC>> 
SC>> How can fix that?
SC>>
SC>
SC>you have 2 possibilites:
SC>
SC>1) set SUID root  the cdda2wav executable:
SC>
SC>chown root.root cdda2wav
SC>chmod 4755 cdda2wav
SC>
SC>or
SC>
SC>2)
SC>
SC>do a
SC>
SC>chmod 666 /dev/sga   (which is the first SCSI generic device for reading RAW
SC>data from CD)
I Don't have any /dev/sga but changing permissions on /dev/sg0 fixed the
problem.
Thanks a lot Benno :-)

 SC>
SC>hope this helps,
SC>
SC>Benno.
--
   ,---._________________________________
  /                                      \   |~~\_____/~~\__  |
 | Christian.Sangohn@post.rwth-aachen.de  >---\______=== )-+
 |  ,---._______________________________/            ~~~|/~~  |
 |/                                                     ()
