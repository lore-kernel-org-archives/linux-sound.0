From: Thomas Sailer <sailer@scs.ch>
Date: Sun, 15 Feb 2004 09:41:30 +0000
Subject: Re: PROBLEM: module es1371: insmod error + statical compile error
Message-Id: <402F3ECA.2080902@scs.ch>
List-Id: <linux-sound.vger.kernel.org>
References: <Pine.A41.4.44.0402090850360.22734-100000@rzaixclu2.rrz.uni-hamburg.de>
In-Reply-To: <Pine.A41.4.44.0402090850360.22734-100000@rzaixclu2.rrz.uni-hamburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Thies Meincke wrote:

> [2.] Full description of the problem/report:
>      cannot load module es1371.o when compiled as module:
>      modprobe es1371:
> /lib/modules/2.4.25-rc1/kernel/drivers/sound/es1371.o: invalid parameter parm_snd_index
> /lib/modules/2.4.25-rc1/kernel/drivers/sound/es1371.o: insmod /lib/modules/2.4.25-rc1/kernel/drivers/sound/es1371.o failed
> /lib/modules/2.4.25-rc1/kernel/drivers/sound/es1371.o: insmod es1371 failed
> m

Remove the "options es1371 parm_snd_index=xx" line from 
/etc/modules.conf, and it should work

Tom

