From: Tan Su Wei <swtan@mmu.edu.my>
Date: Fri, 28 Jan 2000 01:37:43 +0000
Subject: ESS ES1869 Plug and play audio drive configuration problem
Message-Id: <marc-linux-sound-94902346320255@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all,
    I've an ECC ES1869 plug and play audio drive, and I wish to
configure it on my Redhat 6.0 Kernel 2.2.15.
But when I run the sndconfig command:
    It first detected the sound card, but the automatic configuration
was failed: ERROR message:

            modprobe error
The following error occurred running the modprobe
sh: insmod: command not found
sound: No such file or directory
sound: No such file or directory

and then promt for manual setting....
which I'm not sure how to do it...
can some tell why there is such err... and how to encounter it...
and how we can know the irq, DMA , MPU I/O , I/O port setting if we are
required to manually configure it....


Thank you and best regards
Tan Su Wei
