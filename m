From: Bill Nottingham <notting@redhat.com>
Date: Fri, 08 Jan 1999 16:11:06 +0000
Subject: Re: Problems with rvplayer
Message-Id: <marc-linux-sound-91591672220206@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91577868929600@msgid-missing>
In-Reply-To: <marc-linux-sound-91577868929600@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

samad (samad@wanadoo.fr) said: 
> I have problem when I use RealAudio .
> I have :
>     - SB 16 (CMI8330)
>     - kernel 2.1.132
>     - rvplayer 5.0.0.45
> 
> When I want to open a location, I listen the sound one second and I have
> this error:
> 
> [samad@samad samad]$ ****audio: write error: 22 bytes errno: 11
> ****audio: write error: 203 bytes errno: 11

rvplayer won't work with 2.1.late (or 2.2) without a patch/workaround.

One workaround courtesy Thomas Sailer is included at the end of
this message.

Bill
--
Binary only apps such as rvplayer are slightly more
annoying, but they can probably be worked around
by LD_PRELOAD'ing something like the following
(untested, requires the app to be dynamically
linked against glibc2, otherwise you loose).

#include <string.h>
#include <unistd.h>
#include <fcntlbits.h>

extern int __open(const char *pathname, int flags, mode_t mode);
extern int fcntl(int fd, int cmd, long arg);

int open(const char *pathname, int flags, mode_t mode)
{
        int res, rstnblk = flags & O_NONBLOCK && !strcmp(pathname, "/dev/dsp");
        
        res = __open(pathname, flags, mode);
        if (res = -1 || !rstnblk)
                return res;
        fcntl(res, F_SETFL, fcntl(res, F_GETFL, 0) & ~O_NONBLOCK);
        return res;
}
--
