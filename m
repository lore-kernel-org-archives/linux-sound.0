From: Thies Meincke <rz4a016@rrz.uni-hamburg.de>
Date: Mon, 16 Feb 2004 07:20:54 +0000
Subject: Re: PROBLEM: module es1371: insmod error + statical compile error
Message-Id: <Pine.A41.4.44.0402160813210.20156-100000@rzaixclu2.rrz.uni-hamburg.de>
List-Id: <linux-sound.vger.kernel.org>
References: <Pine.A41.4.44.0402090850360.22734-100000@rzaixclu2.rrz.uni-hamburg.de>
In-Reply-To: <Pine.A41.4.44.0402090850360.22734-100000@rzaixclu2.rrz.uni-hamburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


ha - that's it, with one point to mention: the option for es1371 was not
 "parm_snd_index", it was just "snd_index":

I removed this line:
options es1371 snd_index=0

and now it works. The modules.conf was originally from the SuSE 7.3
default kernel.

Thanks a lot,

Thies Meincke



On Sun, 15 Feb 2004, Thomas Sailer wrote:

> Thies Meincke wrote:
>
> > [2.] Full description of the problem/report:
> >      cannot load module es1371.o when compiled as module:
> >      modprobe es1371:
> > /lib/modules/2.4.25-rc1/kernel/drivers/sound/es1371.o: invalid parameter parm_snd_index
> > /lib/modules/2.4.25-rc1/kernel/drivers/sound/es1371.o: insmod /lib/modules/2.4.25-rc1/kernel/drivers/sound/es1371.o failed
> > /lib/modules/2.4.25-rc1/kernel/drivers/sound/es1371.o: insmod es1371 failed
> > m
>
> Remove the "options es1371 parm_snd_index=xx" line from
> /etc/modules.conf, and it should work
>
> Tom
>
>

+----------------------------+-------------------------------------------+
| Thies Meincke              | Tel.  : 040/42838-6355 (BN: 0.42838-6355) |
| Universitaet Hamburg       | Fax   : 040/42838-6270 (BN: 0.42838-6270) |
| Regionales Rechenzentrum   | E-mail: thies.meincke@rrz.uni-hamburg.de  |
| Schlueterstr. 70           | URL   : http://www.rrz.uni-hamburg.de/    |
| 20146 Hamburg              |         RRZ/T.Meincke                     |
+----------------------------+-------------------------------------------+

