From: Brian Craft <bcboy@dorothy.wanglab.brandeis.edu>
Date: Sun, 31 Jan 1999 21:03:36 +0000
Subject: rvplayer
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0OAP2g/MAC+5xKAE"
Message-Id: <marc-linux-sound-91781709325641@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii

Miles --
(is this really the right email address? :)

re: your post on linux-sound, i just spent a week getting
rvplayer to work. it was quite a chore.

to expand on the posted reply, you can preload a lib which redefines
open() & fixes the NONBLOCK problem. two quick ways to do that: you can
cut & paste the code in the email i'm attaching (change "flags" as
documented) or you can just download the rvplayer rpm at rufus, which
includes the fix: http://rufus.w3.org/linux/RPM/RByName.html

this rpm does one annoying thing: it puts the LD_LIBRARY_PATH settings
in the global configuration, in /etc/profile.d. this is pretty lame &
it's better to delete these two files & add the lines to 
/usr/bin/rvplayer:

batduck 3 /home/bcboy> cat `which rvplayer`
#!/bin/sh
LD_LIBRARY_PATH=/usr/lib/rvplayer
export LD_LIBRARY_PATH
LD_PRELOAD=/usr/lib/rvplayer/libnblock.so
export LD_PRELOAD
exec /usr/lib/rvplayer/rvplayer "$@"


there are two other things to watch for:
1) if you're behind a firewall, the default settings will fail,
as they require the ability for the server to initiate a udp
connection with your client (kinda like active mode ftp). the
solution is to view preferences & turn off *all* the udp options
& turn on the "always use tcp" option (under "transport").

the windows version can successfully negotiate this setting with
the server without this step, but for some reason the linux version
is unable to. it will sit there munching cpu trying to read a dead
udp socket. (the binary isn't stripped, so you can run gdb on it &
see this happening).


2) i found that using the file->open command did not work. using
the same file/url on the command line did. this works fine with
netscape, as you set it up to run rvplayer as "rvplayer %s" and
everything is happy.

b.c.

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ra1


Message-ID: <19981119112456.B7554@tantalophile.demon.co.uk>
Date: 	Thu, 19 Nov 1998 11:24:56 +0000
From: Jamie Lokier <lkd@tantalophile.demon.co.uk>
To: linux-kernel@vger.rutgers.edu
Subject: Re: a ld_preload to get rvplayer working

On Wed, Nov 18, 1998 at 09:06:33AM +0000, Paul wrote:
> #define O_NONBLOCK       04000
> extern int libc_open(const char *, int);
> int open(const char *pathname, int flags)
> {
>  if (flags & O_NONBLOCK)
>   flags &= ~O_NONBLOCK;
>  return(__open(pathname, flags));
> }
> 
> Compile it with "gcc -c open.c -o open.o ; ld -shared open.o -o open.so"
> Then run run rvplayer with "LD_PRELOAD=/path/open.so /path/rvplayer"
> Works for me anyway, and I don't have to reboot to listen to broadcasts.

Fine, but a bit of potential for some other bug do to always unmasking
O_NONBLOCK, don't you think?

I use this one, compile in much the same way:

#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#define open __not_open
#include <fcntl.h>
#undef open

/* Change open("/dev/dsp", O_WRONLY|O_NONBLOCK) for RealAudio and Linux 2.1.x.
   Change open("/dev/dsp", O_RDWR|O_NONBLOCK) for Timidity 0.2i.
   Change open("/dev/dsp", O_RDWR) for Quake and Linux 2.1.x. */

int open (const char * pathname, int flags, mode_t mode)
{
  if (!strcmp (pathname, "/dev/dsp") && (flags &= ~O_NONBLOCK) == O_RDWR)
    flags = O_WRONLY;
  return __open (pathname, flags, mode);
}


--0OAP2g/MAC+5xKAE--
