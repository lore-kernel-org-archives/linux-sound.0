From: Benno Senoner <sbenno@gardena.net>
Date: Sun, 20 Jun 1999 14:46:13 +0000
Subject: Re: cdda2wav as user
Message-Id: <marc-linux-sound-92988209016941@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92974250106959@msgid-missing>
In-Reply-To: <marc-linux-sound-92974250106959@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 18 Jun 1999, Sangohn Christian wrote:
> Hello there!
> 
> I have problems running cdda2wav as user (as root everything is OK).
> Here is the output:
> bash-2.01$ cdda2wav -J open(0,0,0) in file interface.c, line
> 857: open error for scsi device: No such file or directory On Linux make sure
> you have the generic SCSI driver installed. Probably you did not define your
> SCSI device. Set the CDDA_DEVICE environment variable or use the -D option.
> You can also define the default device in the Makefile.
> 
> How can fix that?
>

you have 2 possibilites:

1) set SUID root  the cdda2wav executable:

chown root.root cdda2wav
chmod 4755 cdda2wav

or

2)

do a

chmod 666 /dev/sga   (which is the first SCSI generic device for reading RAW
data from CD)

hope this helps,

Benno.
