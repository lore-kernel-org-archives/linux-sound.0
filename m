From: Rusty Russell <rusty@rustcorp.com.au>
Date: Sun, 02 Nov 2003 05:05:16 +0000
Subject: Re: [PATCH] Remove one of sound/oss/cmpci.c compile warnings
Message-Id: <marc-linux-sound-106775423909319@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

In message <Pine.LNX.4.58.0310282002530.4918@dsl-hkigw4g29.dial.inet.fi> you write:
> Hi!
> 
> This patch removes this compile warning:
> 
> sound/oss/cmpci.c: In function `cm_release_mixdev':
> sound/oss/cmpci.c:1465: warning: unused variable `s'
> 
> GCC doesn't seem to unstand that VALIDATE_STATE macro uses s variable.
> I hope this is correct way to fix this.

Because it doesn't.  A better change would be:

VALIDATE_STATE((struct cm_state *)file->private_data);

Or to remove the entire function.

Rusty.
--
  Anyone who quotes me in their sig is an idiot. -- Rusty Russell.
