From: Juhana Sadeharju <kouhia@nic.funet.fi>
Date: Thu, 17 Jun 1999 12:02:44 +0000
Subject: Re: [alsa-devel] New scheduling latencies during audio playing + heavy disk I/O on various kernels
Message-Id: <marc-linux-sound-92962100616666@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>From:	Benno Senoner <sbenno@gardena.net>
>
>audio FX, harddisk recording .. , DURING HIGH DISK ACTIVITY,
>
>Unfortunately the answer is NO, with current kernels.

Your last test had an unlimited disk activity but in an audio application
the disk activity is limited by number of channels times the sample rate.
(We just have to make sure that the audio application is only serious
disk user.)

How about testing it too? Does it really make difference?
I think it makes because your current tests seems to not be limited
in any reasonable way.

>what helped alot is the remount of the disk in sync mode
>( mount / -oremount,sync )
>in this case the average scheduling latencies are very good
>between 16-19ms during the disk stressing tests.

Did you measure the wall clock time used to copy (whatever) the file
in both cases? I have feeling that it took longer to copy the file,
i.e., the same effect what is gained by limiting the disk activity.
So, perhaps we reach the < 20 ms latencies just by using the disk the
way audio software uses it.

But surely a change to kernel would make it possible to limit the disk
activity in favor of RT scheduling.

>I'm not a kernel hacker but IMO the problem seems
>the kernel which holds some locks for too much time 
>during heavy disk I/O, which results in a blocking of the
>write() call (to /dev/dsp).

How about defining a maximum number of swap pages to write to disk at
a time? Does kernel really have to wait for the disk operation to complete?
I have heard the disk interrupt takes only 0.4 ms -- not the tested
50-200 ms. Ok, I know next to nothing about the kernel...

Yours,

Juhana
