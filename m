From: Tony Nugent <tony@growzone.com.au>
Date: Fri, 25 May 2001 14:14:38 +0000
Subject: Re: Kernel hang on a smp system with a es1371 sound card
Message-Id: <marc-linux-sound-99080011606740@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-99071516030392@msgid-missing>
In-Reply-To: <marc-linux-sound-99071516030392@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu May 24 2001 at 16:37, marceln@pion.xs4all.nl wrote:

I don't have a specific answer to your question, but this might
help...

> I had a lot of kernel hangs with an smb system. The sound card
> makes a gives a high peep sound and the system doesn't respond
> any more. The only thing i can do is press the reset button.

Turn on your magic sysrq key and you might then have a way to sanely
recover control of your system without a cold reboot.  In many cases
like this your system may be running fine, but the keyboard may be
in raw mode, there are locked/crashed terminal/X/svgalib/io
processes, or whatever.

  Sysrq allows you to recover from raw kbd mode with
  LeftAlt-PrintScreen-R, and it has several other handy uses like
  resetting the kernel log levels and so on.  LA-SP-K will kill all
  processes running on the current (virtual) terminal (which might
  do the trick in your case).  To do an emergency reboot, LA-PS-s
  (sync) then LA-PS-u (remount everything read-only), and finally
  LA-PS-b (the sequence is s-u-b) for an emergency reboot - and the
  system will come up again with clean filesystems.  But only if the
  kernel is still alive and kicking.

See /usr/src/linux/Documentation/sysrq.txt for the main rave,
/sbin/sysctl and /etc/sysctl.conf for how to enable all this.

Cheers
Tony
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
